Tcl2HTML instproc initPathTruncate files {
    my instvar pathTruncateCount
    set pathTruncateCount 0
    set filesPaths [list]
    # find count of common directory elements
    # "a/b/c" and "a/b/d" has 2 "a/b"
    foreach f $files {
        lappend filesPaths [file split $f]
    }
    while 1 {
        set match 1
        set first 1
        foreach fp $filesPaths {
            if {$pathTruncateCount+1>=[llength $fp]} {
                set match 0
                break
            }
            if {$first} {
                set currentPath [lindex $fp $pathTruncateCount]
                set first 0
            } else {
                if {$currentPath ne [lindex $fp $pathTruncateCount]} {
                    set match 0
                    break
                }
            }
        }
        if {$match} {
            incr pathTruncateCount
        } else {
            break
        }
    }
}
