IDE::CompFileExporter instproc exportObject {cobj directory class} {
    set introProxy [$cobj getIntroProxy]
    set desc [$introProxy getDescriptionForObject $class]
    set cdir [file join $directory [my getFileName [$desc getName]]]
    file mkdir $cdir
    set fileName [my getFileName [$desc getName]]
    my writeFileData $cdir $fileName.tcl [$desc getDefBody]
    my writeFileDataIfContent $cdir $fileName.txt [$cobj getComment]
    my writeFileDic $cdir $fileName.meta [dict create version [$cobj set versioninfo]]
    foreach method [$desc getMethodDescriptions] {
        set type [$method getType]
        if {![info exists typedir($type)]} {
            set typedir($type) [file join $cdir $type]
            file mkdir $typedir($type)
        }
        my exportMethod $typedir($type) $method
    }

}
