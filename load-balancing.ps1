## List the RDS Session
Get-RdsUserSession -TenantName "wvd-tenant2-demo" -HostPoolName "wvd3hp"

## Disconnect the user session
Disconnect-RdsUserSession -TenantName "wvd-tenant-demo" -HostPoolName "wvdhpdemo" -SessionHostName "wvd-demo-vm-0.adfolks.com" -SessionId 2

## Initiate user sign off
Invoke-RdsUserSessionLogoff -TenantName "wvd-tenant2-demo" -HostPoolName "wvd3hp" -SessionHostName "wvd3d-0.adfolks.com" -SessionId 4

## Remove the use session based on username
Get-RdsUserSession -TenantName "wvdadtenant" -HostPoolName "hostpool1" | where { $_.UserPrincipalName -eq "rahul@adfolks.com" } | Invoke-RdsUserSessionLogoff -NoUserPrompt




## WVD Loadbalancer Configuration for Hostpool


## Change the loadbalancer to breadth type
Set-RdsHostPool -TenantName "wvd-tenant-demo" -HostPoolName "wvdhpdemo" -BreadthFirstLoadBalancer -MaxSessionLimit 5

## Change the loadbalancer to deapth type
Set-RdsHostPool -TenantName "wvdadtenant" -HostPoolName "hostpool1" -DepthFirstLoadBalancer -MaxSessionLimit ###




## Configure direct assignment for personal uses

## Update the hostpool for direct access for personal use. 
Set-RdsHostPool -TenantName "wvdadtenant" -HostPoolName "hostpool1" -AssignmentType Direct

## Add the users to Personal Application Group
Add-RdsAppGroupUser -TenantName "wvdadtenant" -HostPoolName "hostpool1" "Desktop Application Group" -UserPrincipalName <userupn>

## Assign the user to the session host.
Set-RdsSessionHost -TenantName "wvdadtenant" -HostPoolName "hostpool1" -Name <sessionhostname> -AssignedUser <userupn>