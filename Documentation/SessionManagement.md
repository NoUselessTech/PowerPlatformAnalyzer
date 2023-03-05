# Session Management

## Login
Interactive Logon:
`Add-PowerAppsAccount`

Non-Interactive logon (User/Pass)
`Add-PowerAppsAccount -UserName <UserName> -Password <Password>`

Non-Interactive Logon (Cert)
`Add-PowerAppsAccount -CertificateThumbprint <hash> -TenantId <TenantId> -AppId <AppId>`

## Logout
Command:
`Remove-PowerAppsAccount`
_Note: Does not take options and removes all credentials_
