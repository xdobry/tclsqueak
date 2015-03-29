IDE::CompFileExporter instproc exportObjList {objects name cobj compDir} {
    if {[llength $objects]>0} {
        set cdir [file join $compDir $name]
        file mkdir $cdir
        foreach object $objects {
            my exportObject $cobj $cdir $object
        }
    }
}
