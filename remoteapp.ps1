## To get the appgroups attached to a host pool
Get-RdsAppGroup -TenantName "wvd-tenant2-demo" -HostPoolName "wvd3hp"


## Create an App Group for Remote Apps to be pubished.. Type will be RemoteApp
New-RdsAppGroup -TenantName "wvd-tenant2-demo" -HostPoolName "wvd3hp" -Name demoapp -ResourceType "RemoteApp"


##  Get a list of Start menu apps on the host pool's virtual machine image
Get-RdsStartMenuApp -TenantName "wvd-tenant2-demo" -HostPoolName "wvd3hp" -AppGroupName demoapp 


## Add the App with its AppAlias mentioned in above command
New-RdsRemoteApp -TenantName "wvd-tenant2-demo" -HostPoolName "wvd3hp" -AppGroupName "demoapp" -Name Notepad -AppAlias notepad



## Add the App with its File pathAlias mentioned in above command
New-RdsRemoteApp -TenantName "wvd-adf-demo" -HostPoolName "wvdhpapp" -AppGroupName adfapp `
                 -Name Adfwordpad `
                 -Filepath "C:\Program Files\Windows NT\Accessories\wordpad.exe"  `
                 -IconPath "C:\Program Files\Windows NT\Accessories\wordpad.exe" `
                 -IconIndex 0


## List the Apps published over the App Group
Get-RdsRemoteApp -TenantName "wvd-tenant2-demo" -HostPoolName "wvd3hp" -AppGroupName demoapp


## Add users to Application Group
Add-RdsAppGroupUser -TenantName "wvd-tenant2-demo" -HostPoolName "wvd3hp" -AppGroupName demoapp -UserPrincipalName arathy.r@adfolks.com

##to remove remote app
 Remove-RdsRemoteApp -TenantName "wvd-tenant-demo" -HostPoolName "wvdhpdemo" -AppGroupName "demoapp"

 ##to remove user from remoteapp
 Remove-RdsAppGroupUser -TenantName "wvd-tenant2-demo" -HostPoolName "wvd2hp" -AppGroupName demoapp -UserPrincipalName usertest002@adfolks.com

 ## Provide the Following Permissions at the root directory of the file share
       CREATOR OWNER               Subfolders and Files Only	              Modify
       Administrator	              This Folder, Subfolders and Files	       Full Control
       Users	                     This Folder Only                          Modify
       Users\Group	              This Folder Only	                     Modify


## remove the App with its AppAlias mentioned in above command
Remove-RdsRemoteApp -TenantName "wvd-tenant2-demo" -HostPoolName "wvd2hp" -AppGroupName "demoapp" -Name Firefox 















