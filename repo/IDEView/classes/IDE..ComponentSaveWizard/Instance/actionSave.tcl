IDE::ComponentSaveWizard instproc actionSave {} {
    my instvar nometa onefile targetDir createPkgIndex
    set comps [[self]::savecomp getList]
    if {$comps eq ""} {
        IDE::Dialog message "No components to save were selected"
        return
    }
    IDE::Component saveComplex $comps $nometa $onefile $targetDir
    if {$createPkgIndex} {
        pkg_mkIndex -direct [pwd] *.xotcl
    }
    my destroy
}
