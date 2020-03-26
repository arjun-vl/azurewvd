##log into tenant
Add-RdsAccount -DeploymentUrl "https://rdbroker.wvd.microsoft.com"


##install module 
Install-Module -Name Microsoft.RDInfra.RDPowerShell

##import module 
Import-Module -Name Microsoft.RDInfra.RDPowerShell

##update module
Update-Module -Name Microsoft.RDInfra.RDPowerShell


##command to create new WVD tenant 
New-RdsTenant -Name “wvd-tenant2-demo” -AadTenantId “a86bc255-9bb7-4ee8-b30a-51fba84872aa” -AzureSubscriptionId “aec3f8b4-cf54-41d2-bc4a-1c00434d2ef8”

##command for admin access to the second person in created tenant
New-RdsRoleAssignment -TenantName “wvd-tenant2-demo” -SignInName rahul@adfolks.com -RoleDefinitionName "RDS Owner"


#deploy the hostpool from azure portal


##create hostpool
New-RdsHostPool -TenantName “wvd-tenant2-demo” -Name “wvd3hp”


##adding a user to default app group for RDP
Add-RdsAppGroupUser -TenantName “wvd-tenant-demo” -HostPoolName “wvdhpdemo” -AppGroupName "Desktop Application Group" -UserPrincipalName “usertest002@adfolks.com”



##install wvd agent and wvd boot loader on session host


##adding user to the default desktop app
Add-RdsAppGroupUser <tenantname> <hostpoolname> "Desktop Application Group" -UserPrincipalName <userupn>



##list the servers inside a host pool
Get-RdsSessionHost -TenantName “your-tenant-name” -HostPoolName "hostpool-name"


