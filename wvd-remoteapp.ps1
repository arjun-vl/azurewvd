## To get the appgroups attached to a host pool
Get-RdsAppGroup -TenantName "your tenant name" -HostPoolName "your hostpool name"


## Create an App Group for Remote Apps to be pubished.. Type will be RemoteApp
New-RdsAppGroup -TenantName "your tenant name" -HostPoolName "your hostpool name" -Name "app name" -ResourceType "RemoteApp"


##  Get a list of Start menu apps on the host pool's virtual machine image
Get-RdsStartMenuApp -TenantName "your tenant name" -HostPoolName "your hostpool name" -AppGroupName "app name" 


## Add the App with its AppAlias mentioned in above command
New-RdsRemoteApp -TenantName "your tenant name" -HostPoolName "your hostpool name" -AppGroupName "app name" -Name "name to the app" -AppAlias "alias name"


## Add the App with its File pathAlias mentioned in above command
New-RdsRemoteApp -TenantName "your tenant name" -HostPoolName "your hostpool name" -AppGroupName "app name" 
                 -Name Adfwordpad `
                 -Filepath "C:\Program Files\Windows NT\Accessories\wordpad.exe"  `
                 -IconPath "C:\Program Files\Windows NT\Accessories\wordpad.exe" `
                 -IconIndex 0


## List the Apps published over the App Group
Get-RdsRemoteApp -TenantName "your tenant name" -HostPoolName "your hsotpool name" -AppGroupName "app name"


## Add users to Application Group
Add-RdsAppGroupUser -TenantName "your tenant name" -HostPoolName "your hostpool name" -AppGroupName "app name" -UserPrincipalName "user UPN"

##to remove remote app
 Remove-RdsRemoteApp -TenantName "your tenant name" -HostPoolName "your hostpool name" -AppGroupName "app name"

 ##to remove user from remoteapp
 Remove-RdsAppGroupUser -TenantName "your tenant name" -HostPoolName "your hostpool name" -AppGroupName "app name" -UserPrincipalName "user UPN"


## remove the App with its AppAlias mentioned in above command
Remove-RdsRemoteApp -TenantName "your tenant name" -HostPoolName "your hostpool name" -AppGroupName "app name" -Name "name of app" 















