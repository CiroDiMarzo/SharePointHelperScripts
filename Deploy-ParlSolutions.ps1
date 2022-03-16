Add-PSSnapin *sharepoint*

$sourcePath = "C:\Users\garaio-admin\Documents"
$fileFormat = "Parl.Dms.{0}.wsp"
$webApplication = "http://pddokuclu-test.garaio.ch/"

$wspGlobalList = @([string]::Format($fileFormat, "Admin"),
                [string]::Format($fileFormat, "Services"))
                

$wspWebList = @([string]::Format($fileFormat, "Apps"),
                [string]::Format($fileFormat, "Core"))

foreach ($wsp in $wspGlobalList) {
    Write-Host -ForegroundColor Green "Uninstalling $wsp"
    Uninstall-SPSolution -Identity $wsp -Confirm:$false
}

foreach ($wsp in $wspWebList) {
    Write-Host -ForegroundColor Green "Uninstalling $wsp"
    Uninstall-SPSolution -Identity $wsp -WebApplication $webApplication -Confirm:$false
}

$confirmation = Read-Host "Solutions uninstall command executed. Proceed with removing? [y/n]"
while($confirmation -ne "y")
{
    if ($confirmation -eq 'n') {exit}
    $confirmation = Read-Host "Solutions uninstall command executed. Proceed with removing? [y/n]"
}

foreach ($wsp in $wspGlobalList) {
    Write-Host -ForegroundColor Green "Removing $wsp"
    Remove-SPSolution -Identity $wsp -Confirm:$false
}

foreach ($wsp in $wspWebList) {
    Write-Host -ForegroundColor Green "Removing $wsp"
    Remove-SPSolution -Identity $wsp -Confirm:$false
}

Write-Host -ForegroundColor Yellow "Solutions removed, proceeding with adding."

foreach ($wsp in $wspGlobalList) {
    Write-Host -ForegroundColor Green "Adding $wsp"
    Add-SPSolution -LiteralPath "$sourcePath\$wsp" -Confirm:$false
}

foreach ($wsp in $wspWebList) {
    Write-Host -ForegroundColor Green "Adding $wsp"
    Add-SPSolution -LiteralPath "$sourcePath\$wsp" -Confirm:$false
}

Write-Host -ForegroundColor Yellow "Solutions added, proceeding with installation."

foreach ($wsp in $wspGlobalList) {
    Write-Host -ForegroundColor Green "Installing $wsp"
    Install-SPSolution -Identity $wsp -GACDeployment -Confirm:$false
}

foreach ($wsp in $wspWebList) {
    Write-Host -ForegroundColor Green "Installing $wsp"
    Install-SPSolution -Identity $wsp -WebApplication $webApplication -GACDeployment -Confirm:$false
}

Write-Host -ForegroundColor Yellow "It is done."