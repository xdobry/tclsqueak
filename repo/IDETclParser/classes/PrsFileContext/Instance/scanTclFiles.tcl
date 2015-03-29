PrsFileContext instproc scanTclFiles dir {
    set files [list]
    foreach f [glob -directory $dir -nocomplain -types {f r} *.tcl *.itcl *.tk *.xotcl *.itk] {
        if {[file tail $f] eq "pkgIndex.tcl"} continue
        lappend files $f
    }
    foreach d [glob -directory $dir -nocomplain -types {d r} *] {
        lappend files {*}[my scanTclFiles $d]
    }
    return $files
}
