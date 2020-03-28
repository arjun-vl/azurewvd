
##Get Azure AD ID from Azure portal 
##Get Azure Subscription ID  from Azure portal


##install module in the powershell 
Install-Module -Name Microsoft.RDInfra.RDPowerShell

##import module 
Import-Module -Name Microsoft.RDInfra.RDPowerShell

##update module
Update-Module -Name Microsoft.RDInfra.RDPowerShell


##log into tenant
Add-RdsAccount -DeploymentUrl "https://rdbroker.wvd.microsoft.com"

##get rds wvd tenent
Get-RdsTenant
 
##to remove rds wvd tenant
Remove-RdsTenant -Name "tenant name"

## to list the hostpools inside a tenant 
Get-RdsHostPool -TenantName "your tenant name"

##list the servers inside a hostpool
Get-RdsSessionHost -TenantName "your tenant name" -HostPoolName "your hostpool name"

##to get the appgroups attached to a host pool
Get-RdsAppGroup -TenantName "your tenant name" -HostPoolName "your hostpool name"


##to remove appgrp from hostpool
Remove-RdsAppGroup -TenantName "your tenant name" -HostPoolName "your hostpool name" -Name "your app group name"


##to remove host  pool from a tenant
Remove-RdsHostPool -TenantName "your tenant name" -Name "your hostpool name"


##to get RDS user session
Get-RdsUserSession -TenantName "youe tenant name" -HostPoolName "your hostpool name"
 


 ##disable and enable new session to a session host
 Set-RdsSessionHost -TenantName "your tenant name" -HostPoolName "your hostpool name" -Name "session server name" -AllowNewSession $true


 ##to remove user frpm app group
 Remove-RdsAppGroupUser -TenantName "your tenant name" -HostPoolName "your hostpool name" -AppGroupName "Desktop Application Group" -UserPrincipalName "UPN in azure AD"


 ## Add Users to Default Remote Desktop Group.
Add-RdsAppGroupUser -TenantName "your tenant name" -HostPoolName "your hostpool name" -AppGroupName "Desktop Application Group" -UserPrincipalName "UPN in azure AD"
 

 ##to get the RDS session host
 Get-RdsSessionHost -TenantName "your tenant name" -HostPoolName "your hostpool name"

##force to remove the session host
Remove-RdsSessionhost -TenantName "your tenent name" -HostPoolName "your hospool name" -Name "session host name" -Force


Remove-RdsAppGroup -TenantName "wvd-tenant-demo" -HostPoolName "wvdhpdemo" -Name "Desktop Application Group"



