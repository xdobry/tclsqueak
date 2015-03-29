proc repobs::getElemsForType {repo path type pattern} {
    set dir [file join $repo {*}[getFilePath $path]]
    set elems [list]
    if {![file isdirectory $dir]} {
        return $elems
    }
    set ordfile [file join $dir deforder.repo]
    set readdirs [list]
    if {[file exists $ordfile]} {
        foreach d [readFileAsList $ordfile] {
            set fd [asFileName $d]
            lappend readdirs $fd
            set dname [file join $dir $fd]
            if {$type eq "d"} {
                if {[file isdirectory $dname]} {
                    lappend elems $d
                }
            } else {
                if {[file isfile $dname]} {
                    lappend elems $d
                }
            }
        }
    }
    foreach elem [glob -nocomplain -directory $dir -type $type $pattern] {
        if {[file tail $elem] ni $readdirs} {
            if {$pattern ne "*"} {
                set name [file rootname [file tail $elem]]
            } else {
                set name [fileToCompName [file tail $elem]]
            }
            lappend elems $name
        }
    }
    return $elems
}
