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


