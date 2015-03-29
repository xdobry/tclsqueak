proc repobs::getSourceFromDir {dir {withComments 0}} {
    variable useCompMeta
    # a hack for loading ide @ is used to align object/classes to component
    set source ""
    foreach f [lsort [glob -nocomplain -directory $dir -types f *.tcl]] {
        if {$withComments} {
            set cfile [file rootname $f].txt
            if {[file exists $cfile]} {
                append source [readFileAsComment $cfile]
            }
        }
        set part [readFile $f]
        append source $part
        if {[string index $part end] ne "\n"} {
            append source \n
        }
    }
    if {$useCompMeta && [lindex [file split $dir] end-1] in {classes objects}} {
        set path [file split $dir]
        set oname [fileToCompName [lindex $path end]]
        append source "@ $oname idemeta component [fileToCompName [lindex $path end-2]]\n"
    }
    set ordfile [file join $dir deforder.repo]
    set readdirs [list]
    if {[file exists $ordfile]} {
        foreach d [readFileAsList $ordfile] {
            set fd [asFileName $d]
            lappend readdirs $fd
            set dname [file join $dir $fd]
            if {[file isdirectory $dname]} {
                set part [getSourceFromDir $dname $withComments]
                append source $part
                if {[string index $part end] ne "\n"} {
                    append source \n
                }
            }
        }
    }
    foreach f [glob -nocomplain -directory $dir -types d *] {
        if {[file tail $f] ni $readdirs} {
            append source [getSourceFromDir $f $withComments]
        }
    }
    foreach f [lsort [glob -nocomplain -directory $dir -types f *.init]] {
        set part [readFile $f]
        append source $part
        if {[string index $part end] ne "\n"} {
            append source \n
        }
    }
    return $source
}
