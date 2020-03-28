##log into tenant
Add-RdsAccount -DeploymentUrl "https://rdbroker.wvd.microsoft.com"


##install module 
Install-Module -Name Microsoft.RDInfra.RDPowerShell

##import module 
Import-Module -Name Microsoft.RDInfra.RDPowerShell

##update module
Update-Module -Name Microsoft.RDInfra.RDPowerShell

##Adding tenant creator permission to the UPN through azure portal from Enterprise application-->windows virtual desktop
##This user will be able to create and manage the WVD

##command to create new WVD tenant 
New-RdsTenant -Name “your tenant name” -AadTenantId “your AD ID” -AzureSubscriptionId “your azure subscription ID”

##command for admin access to the second person in created tenant
New-RdsRoleAssignment -TenantName “your tenant name” -SignInName "UPN of user" -RoleDefinitionName "RDS Owner"


##deploy the hostpool from azure portal
##https://docs.microsoft.com/en-us/azure/virtual-desktop/create-host-pools-azure-marketplace

##create hostpool
New-RdsHostPool -TenantName “your tenant name” -Name “your hostpool name”


##adding a user to default app group for RDP
Add-RdsAppGroupUser -TenantName “your tenant name” -HostPoolName “your hostpool name” -AppGroupName "Desktop Application Group" -UserPrincipalName “UPN of user”


##If the session hosts are not listing under hostpool , follow the steps to manually add them to the tenant hostpool
##install wvd agent and wvd boot loader on session host
##https://docs.microsoft.com/en-us/azure/virtual-desktop/create-host-pools-powershell

##Once the session hosts are added to the hostpool

##adding user to the default desktop app
Add-RdsAppGroupUser <tenantname> <hostpoolname> "Desktop Application Group" -UserPrincipalName <userupn>

##Add the same user through azure portal in Enterprise application-->windows virtual desktop client , then this user will be able to access the WVD client(web/desktop client)

##list the servers inside a host pool
Get-RdsSessionHost -TenantName “your-tenant-name” -HostPoolName "hostpool-name"

##create Azure File share for setting up FSLogix prifiling 

##create a file share loaction from azure file share

##Add permission to the users in WVD tenant , so that the users in WVD can create their profiles in Azure file share.
##The permissions of each users will be comntrolled from a mangement server.
##In azure portal click on the connet tab for respective file share path, there will be instructions to connect to the file share.
##Once this is connected to the management server , Right click on the attached network share folder --> properties --> advanced.
##In this pane you wil be able to control the user access and permissions
##set the following permissions

       CREATOR OWNER               Subfolders and Files Only	               Modify
       Administrator	             This Folder, Subfolders and Files	       Full Control
       Users	                     This Folder Only                          Modify
       Users\Group	               This Folder Only	                         Modify

##FSLogix set up 

#follow the link for more details https://docs.microsoft.com/en-us/azure/virtual-desktop/create-fslogix-profile-container

Connect to the virtual machine with the credentials you provided when creating the virtual machine.
       Launch an internet browser and navigate to this link to download the FSLogix agent.
       Navigate to either \\Win32\Release or \\X64\Release in the .zip file and run FSLogixAppsSetup to install the FSLogix agent. To learn more about how to install FSLogix, see Download and install FSLogix.
       Navigate to Program Files > FSLogix > Apps to confirm the agent installed.
       From the start menu, run RegEdit as an administrator. Navigate to Computer\HKEY_LOCAL_MACHINE\software\FSLogix.
       Create a key named Profiles.
       Create the following values for the Profiles key:
           
              DeleteLocalProfileWhenVHDShouldApply       DWORD(32-bit)      value=1   : delete local profile if exists and matches the profile being loaded from VHD
              Enabled                                    DWORD(32-bit)      value=1   : Enables the Fslogic Profiles
              FlipFlopProfileDirectoryName               DWORD(32-bit)      value=1   : When set to ‘1’ the SID folder is created as “%username%%sid%” instead of the default “%sid%%username%”. This setting has the same effect as setting SIDDirNamePattern = “%username%%sid%” and SIDDirNameMatch = “%username%%sid%”.
              FoldersToRemove                            REG_MULTI_SZ       no value
              VHDLocations                               REG_MULTI_SZ       value= ##sharefile location (mount path)
              VolumeType                                 REG_SZ             value=vhd







