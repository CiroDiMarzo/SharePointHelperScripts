function RemoveSite {
    param (
        [string] $siteUrl
    )

    Write-Host -ForegroundColor Green "Removing site $siteUrl"

    Remove-SPWeb -Identity $siteUrl -Recycle -Confirm:$false   
}