

##Azure AD ID   a86bc255-9bb7-4ee8-b30a-51fba84872aa
##Azure Subscription ID   aec3f8b4-cf54-41d2-bc4a-1c00434d2ef8
##


##log into tenant
Add-RdsAccount -DeploymentUrl "https://rdbroker.wvd.microsoft.com"


##install module 
Install-Module -Name Microsoft.RDInfra.RDPowerShell

##import module 
Import-Module -Name Microsoft.RDInfra.RDPowerShell

##update module
Update-Module -Name Microsoft.RDInfra.RDPowerShell

##get rds wvd tenent
Get-RdsTenant
 
##to remove rds wvd tenant
Remove-RdsTenant -Name "vdi-test-us"

## to list the hostpools inside a tenant 
Get-RdsHostPool -TenantName "wvd-tenant2-demo"

##list the servers inside a host pool
Get-RdsSessionHost -TenantName "vdi-test-us" -HostPoolName "vdi-hp"

##to get the appgroups attached to a host pool
Get-RdsAppGroup -TenantName "wvd-tenant2-demo" -HostPoolName "wvd2hp"


##to remove appgrp from hostpool
Remove-RdsAppGroup -TenantName "wvd-tenant2-demo" -HostPoolName "wvd2hp" -Name "demoapp"


##to remove host  pool from a tenant
Remove-RdsHostPool -TenantName "wvd-tenant-demo" -Name "wvdhpdemo"


##to get RDS user session
Get-RdsUserSession -TenantName "wvd-tenant-demo" -HostPoolName "wvdhpdemo"
 


 ##disable and enable new session to a session host
 Set-RdsSessionHost -TenantName "wvd-tenant2-demo" -HostPoolName "wvd2hp" -Name "wvd2fvm-0.adfolks.com" -AllowNewSession $true


 ##to remove user frpm app group
 Remove-RdsAppGroupUser -TenantName "wvd-tenant-demo" -HostPoolName "wvdhpdemo" -AppGroupName "Desktop Application Group" -UserPrincipalName "usertest002@adfolks.com"


 ## Add Users to Default Remote Desktop Group.
Add-RdsAppGroupUser -TenantName vdi-test-us -HostPoolName vdi-hp -AppGroupName "Desktop Application Group" -UserPrincipalName test1@adfolks.onmicrosoft.com
 

 ##to get the RDS session host
 Get-RdsSessionHost -TenantName "wvd-tenant-demo" -HostPoolName "wvdhpdemo"

##force to remove the session host
Remove-RdsSessionhost -TenantName "wvd-tenant-demo" -HostPoolName "wvdhpdemo" -Name "wvd-demo-vm-0.adfolks.com" -Force


Remove-RdsAppGroup -TenantName "wvd-tenant-demo" -HostPoolName "wvdhpdemo" -Name "Desktop Application Group"



