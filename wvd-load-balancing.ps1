## List the RDS Session
Get-RdsUserSession -TenantName "your tenant name" -HostPoolName "your hostpool name"

## Disconnect the user session
Disconnect-RdsUserSession -TenantName "your tenant name" -HostPoolName "your hostpool name" -SessionHostName "session server name" -SessionId "session ID shown"

## Initiate user sign off
Invoke-RdsUserSessionLogoff -TenantName "your tenant name" -HostPoolName "your hostpool name" -SessionHostName "session server name" -SessionId "session ID shown"

## Remove the use session based on username
Get-RdsUserSession -TenantName "your tenant name" -HostPoolName "your hostpool name" | where { $_.UserPrincipalName -eq "rahul@adfolks.com" } | Invoke-RdsUserSessionLogoff -NoUserPrompt



## WVD Loadbalancer Configuration for Hostpool


## Change the loadbalancer to breadth type
Set-RdsHostPool -TenantName "your tenant name" -HostPoolName "your hostpool name" -BreadthFirstLoadBalancer -MaxSessionLimit 5

## Change the loadbalancer to deapth type
Set-RdsHostPool -TenantName "your tenant name" -HostPoolName "your hostpool name" -DepthFirstLoadBalancer -MaxSessionLimit ###



## Configure direct assignment for personal uses

## Update the hostpool for direct access for personal use. 
Set-RdsHostPool -TenantName "your tenant name" -HostPoolName "your hostpool name" -AssignmentType Direct

## Add the users to Personal Application Group
Add-RdsAppGroupUser -TenantName "your tenant name" -HostPoolName "your hostpool name" "Desktop Application Group" -UserPrincipalName <userupn>

## Assign the user to the session host.
Set-RdsSessionHost -TenantName "your tenant name" -HostPoolName "your hostpool name" -Name <sessionhostname> -AssignedUser <userupn>



