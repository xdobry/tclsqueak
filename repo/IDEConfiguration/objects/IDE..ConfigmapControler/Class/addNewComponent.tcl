IDE::ConfigmapControler proc addNewComponent {} {
    my instvar componentGroups componentArr selectedVersion
    # remove already selected components
    set snames [ide::lcollect each [${selectedVersion}::components getList] {$each name}]
    foreach cgroup $componentGroups {
        set name [$cgroup name]
        if {![ide::lcontain $snames $name]} {
            lappend fcomponentGroups $cgroup 
            set fcomponentArr($name) $componentArr($name)
        }
    }
    set objs [IDE::EditionsMultiChooser getVersions $fcomponentGroups [array get fcomponentArr]]
    foreach obj $objs {
        [my set view]::components insertObjectAt $obj end
        ${selectedVersion}::components insertObjectAt $obj end
    }
}
