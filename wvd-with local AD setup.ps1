##Create a replica of local AD or On-prim AD to our Azure v-net.

##on the v-net we neet to deploy the WVD hostpool

##Change the setting of DNS server in your v-net using custom , add the local AD replica server private IP.
  this will the servers to join the domin, which deployed part of hostpool cration through azure portal

##once after deploying the hostpool under concerned tenant


##install the AD connect to the local AD replica server or On-prim AD copy server 

##use this link to download AD connect https://www.microsoft.com/en-us/download/details.aspx?id=47594

##you need to have a local AD admin credential(this user need to be added in Enterprise admin group). Also you need to be Global admininistrator in azure account , also be part of AAD DC Administrators

##Install the AD connect in local AD server , so that the users in local AD will be sync with our Azure AD. 

##user in the local AD will reflected in Azure AD with user name and domain with ".onmicrosoft.com"

##this user name we need to use for adding users to WVD servers(session host in hostpool)

##Each WVD web or desktop client session ask for dual authentication

   1. Authenctication to WVD 
   2. Authentication to WVD hostpool Desktop app or Remote app

##In this set up , when a user is accessing WVD web or desktop client 

    1. In WVD authentication.They need to provide the username which is replicated in Azure AD (user name and domain with ".onmicrosoft.com") and local AD password.
    2. In WVD hostpool Desktop app or Remote app authentication , they need to provide their local AD credentials
    
 ##managemnt and all other checks are same 
    
    
    
    
    
