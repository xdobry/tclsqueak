IDE::ComponentSaveWizard instproc actionSave {} {
    my instvar nometa onefile targetDir createPkgIndex type
    set comps [[self]::savecomp getList]
    if {$comps eq ""} {
        IDE::Dialog message "No components to save were selected"
        return
    }
    if {$type eq "package"} {
        IDE::Component saveComplex $comps $nometa $onefile $targetDir
        if {$createPkgIndex} {
            pkg_mkIndex -direct [pwd] *.xotcl
        }
    } elseif {$type eq "fileTree"} {
        set exp [IDE::CompFileExporter new]
        foreach comp $comps {
            set cobj [IDE::Component getCompObjectForNameIfExist $comp]
            if {$cobj ne "" && [$cobj isPersistent]} {
                $exp exportCompObj $cobj $targetDir 1
            }
        }
    }
    my destroy
}
