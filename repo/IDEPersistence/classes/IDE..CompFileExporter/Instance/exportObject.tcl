IDE::CompFileExporter instproc exportObject {cobj directory class} {
    set introProxy [$cobj getIntroProxy]
    set desc [$introProxy getDescriptionForObject $class]
    set cdir [file join $directory [my getFileName [$desc getName]]]
    file mkdir $cdir
    my writeFileData $cdir [$desc getName].tcl [$desc getDefBody]
    my writeFileDataIfContent $cdir [$desc getName].txt [$cobj getComment]
    my writeFileDic $cdir [$desc getName].meta [dict create version [$cobj set versioninfo]]
    foreach method [$desc getMethodDescriptions] {
        set type [$method getType]
        if {![info exists typedir($type)]} {
            set typedir($type) [file join $cdir $type]
            file mkdir $typedir($type)
        }
        my exportMethod $typedir($type) $method
    }

}
