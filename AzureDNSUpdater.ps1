# Azure DNS Updater 
# To be done: hold the creds in KeyVault.

#region Setup with Creds
    $tenantID = ""
    $subscriptionID = ""
    # Service Principle User/PW
        $PrinPW = ""
        $User = ""
    $PWord = ConvertTo-SecureString -String $PrinPW -AsPlainText -Force
    $Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PWord
#endregion

#region Connect to Azure with the creds above. 
    echo "Connecting to Azure"
    Connect-AzAccount -ServicePrincipal -TenantId $tenantID -Credential $Credential
    echo "Connected."
#endregion

#region find IP Address
    $NewDNSIP = (Invoke-WebRequest -uri "http://ifconfig.me/ip").Content
    echo "Public IP Address:" $NewDNSIP
#endregion

#region Execute DNS Record Change
    echo "Attempting to update DNS Record."
    $rs = Get-AzDnsRecordSet -name 'nameofrecord' -RecordType A -ZoneName "yourdnszone.com" -ResourceGroupName "yourresourcegroup"
    $rs.Records[0].Ipv4Address = $NewDNSIP
    Set-AzDnsRecordSet -RecordSet $rs
    echo "Done."
#endregion
