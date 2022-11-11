$subs = Get-AzureRmSubscription

foreach ($sub in $subs) {
    Select-AzureRmSubscription -SubscriptionId $sub.Id
    $nsgs = Get-AzureRmNetworkSecurityGroup

    Foreach ($nsg in $nsgs) {
        $nsgRules = $nsg.SecurityRules

        foreach ($nsgRule in $nsgRules) {
            $nsgRule | Select-Object @{n='SubscriptionName';e={$sub.Name}},
                @{n='ResourceGroupName';e={$nsg.ResourceGroupName}},
                @{n='NetworkSecurityGroupName';e={$nsg.Name}},
                Name,Description,Priority,
                @{Name='SourceAddressPrefix';Expression={[string]::join(",", ($_.SourceAddressPrefix))}},
                @{Name='SourcePortRange';Expression={[string]::join(",", ($_.SourcePortRange))}},
                @{Name='DestinationAddressPrefix';Expression={[string]::join(",", ($_.DestinationAddressPrefix))}},
                @{Name='DestinationPortRange';Expression={[string]::join(",", ($_.DestinationPortRange))}},
                Protocol,Access,Direction |
                    Export-Csv "C:\project1\NsgRules.csv" -NoTypeInformation -Encoding ASCII -Append        
        }
    }
}