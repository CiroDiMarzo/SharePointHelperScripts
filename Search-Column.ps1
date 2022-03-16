[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint")

$site = New-Object Microsoft.SharePoint.SPSite("http://pddokuclu-test.garaio.ch/docs/2")
$fieldName = "Dokumententyp"
foreach ($spWeb in $site.AllWebs) {
    Write-Host -ForegroundColor Green "Reading web $($spWeb.Title)"
    foreach ($ct in $spWeb.ContentTypes) {
        foreach ($field in $ct.Fields) {
            if ($field.InternalName -eq $fieldName) {
                Write-Host -ForegroundColor Red "Web $($spWeb.Title) has the field $fieldName in ct $($ct.Name)"
            }   
        }
    }
    # foreach ($innerWeb in $spWeb.Webs) {
    #     Write-Host -ForegroundColor Green "Reading web $($innerWeb.Title)"
    #     foreach ($ct in $innerWeb.ContentTypes) {
    #         foreach ($field in $ct.Fields) {
    #             if ($field.Title -eq $fieldName) {
    #                 Write-Host -ForegroundColor Red "Web $($spWeb.Title) has the field $fieldName in ct $($ct.Name)"
    #                 $r = Read-Host
    #             }   
    #         }
    #     }
    # }
}

# Web 2 has the field {resource:DokDatum} in ct Project Policy
# Web 2 has the field {resource:DokDatum} in ct ParlDoc
# Web 2 has the field {resource:DokDatum} in ct ParlDocEparl
# Web 2 has the field {resource:DokDatum} in ct ParlDocEparlExt
# Web 2 has the field {resource:DokDatum} in ct System Media Collection
# Web 2 has the field Access rights in ct Project Policy
# Web 2 has the field Access rights in ct ParlDocEparlExt
# Web 2 has the field Access rights in ct System Media Collection
# Web 2 has the field Author (text) in ct Project Policy
# Web 2 has the field Author in ct Project Policy
# Web 2 has the field Author in ct ParlDoc
# Web 2 has the field Author in ct ParlDocEparl
# Web 2 has the field Author in ct ParlDocEparlExt
# Web 2 has the field Author in ct Video Rendition
# Web 2 has the field Author in ct Audio
# Web 2 has the field Author in ct Image
# Web 2 has the field Author in ct System Media Collection
# Web 2 has the field Author in ct System Media Collection
# Web 2 has the field Declassification note in ct Project Policy
# Web 2 has the field Declassification note in ct ParlDoc
# Web 2 has the field Declassification note in ct ParlDocEparl
# Web 2 has the field Declassification note in ct ParlDocEparlExt
# Web 2 has the field Declassification note in ct System Media Collection
# Web 2 has the field Classification in ct Project Policy
# Web 2 has the field Classification in ct ParlDoc
# Web 2 has the field Classification in ct ParlDocEparl
# Web 2 has the field Classification in ct ParlDocEparlExt
# Web 2 has the field Classification in ct System Media Collection
# Web 2 has the field e-parl in ct Project Policy
# Web 2 has the field e-parl in ct ParlDocEparl
# Web 2 has the field e-parl in ct ParlDocEparlExt
# Web 2 has the field e-parl in ct System Media Collection
# Web 2 has the field Icon in ct Project Policy
# Web 2 has the field Icon in ct Project Policy
# Web 2 has the field Icon (text) in ct ParlDoc
# Web 2 has the field Icon in ct ParlDocEparl
# Web 2 has the field Icon in ct ParlDocEparlExt
# Web 2 has the field Icon in ct JavaScript Display Template
# Web 2 has the field Icon in ct System Media Collection
# Web 2 has the field Icon in ct System Media Collection
# Web 2 has the field Teildossier in ct Project Policy
# Web 2 has the field Teildossier in ct ParlDoc
# Web 2 has the field Teildossier in ct ParlDocEparl
# Web 2 has the field Teildossier in ct ParlDocEparlExt
# Web 2 has the field Teildossier in ct System Media Collection
# Web 2 has the field Dokumententyp in ct Project Policy
# Web 2 has the field Dokumententyp in ct ParlDoc
# Web 2 has the field Dokumententyp in ct ParlDocEparl
# Web 2 has the field Dokumententyp in ct ParlDocEparlExt
# Web 2 has the field Dokumententyp in ct System Media Collection