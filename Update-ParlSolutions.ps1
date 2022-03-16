Add-PSSnapin *sharepoint*

$sourcePath = "C:\Users\garaio-admin\Documents"
$fileFormat = "Parl.Dms.{0}.wsp"

$wspList = @([string]::Format($fileFormat, "Admin"),
                [string]::Format($fileFormat, "Apps"),
                [string]::Format($fileFormat, "Services"),
                [string]::Format($fileFormat, "Core"))

foreach ($wsp in $wspList) {
    Write-Host -ForegroundColor Green "Updating $wsp"
    Update-SPSolution -Identity $wsp -LiteralPath "$sourcePath\$wsp" -GACDeployment
}

Write-Host -ForegroundColor Green "It is done."