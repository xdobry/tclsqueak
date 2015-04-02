proc repobs::getMeta {repo path} {
    set meta [dict create comment {} body {}]
    set fpath [getFilePath $path]
    set fname [lindex $fpath end]
    set of [file join $repo {*}$fpath]
    if {[file isdirectory $of]} {
        set dir $of
    } else {
        set dir [file dirname $of]
    }
    set f [file join $dir $fname.tcl]
    if {[file isfile $f]} {
        dict set meta body [readFile $f]
    } else {
        #puts "can not find body for $path - $f"
    }
    set f [file join $dir $fname.txt]
    if {[file isfile $f]} {
        dict set meta comment [readFile $f]
    }
    set f [file join $dir $fname.meta]
    if {[file isfile $f]} {
        set meta [dict merge $meta [readFileAsDict $f]]
    }
    set f [file join $dir version.info]
    if {[file isfile $f]} {
        dict set meta version [string trim [readFile $f]]
    }
    set f [file join $dir require.list]
    if {[file isfile $f]} {
        dict set meta required [readFileAsList $f]
    }
    return $meta
}
