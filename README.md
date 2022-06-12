# Azure DNS Updater - Powershell

This script is designed to update a Azure DNS Zone within your tenant based on the networks public IP. 

This script is great for those with dynamic IP addresses but need to host services. 

It uses a Azure AD Registered App and a service priniciple for that App to Auth with. Then connects to the Azure DNS Zone and updates it. 

## Azure Setup
For this to work, you need to have the following things.

- Azure Tenant
- Azure Subscription
- Azure DNS Zone setup
- Azure AD
- Registered App within Azure AD
- Service Principle with the appropriate rights to the DNS Zone

## Powershell Setup
This uses the Az module, run the following command to install

``` Install-Module Az -AllowClobber ```
