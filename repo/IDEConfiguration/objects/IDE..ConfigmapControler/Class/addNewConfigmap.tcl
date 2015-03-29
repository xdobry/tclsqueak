IDE::ConfigmapControler proc addNewConfigmap {} {
    my instvar configmapGroups configmapArr selectedVersion
    set snames [$selectedVersion getCMapsNamesDeep]
    foreach cgroup $configmapGroups {
        set name [$cgroup name]
        if {[$selectedVersion name]==$name} continue
        if {![ide::lcontain $snames $name]} {
            lappend fconfigmapGroups $cgroup 
            set fconfigmapArr($name) $configmapArr($name)
        }
    }
    set objs [IDE::EditionsMultiChooser getVersions $fconfigmapGroups [array get fconfigmapArr]]
    foreach obj $objs {
        [my set view]::cmaps insertObjectAt $obj 0
        ${selectedVersion}::childconigmaps insertObjectAt $obj 0
    }
}
