IDE::TclProcsDescription proc getAllUnRegisteredMethods {} {
    set allMethods [my getAllMethodsFromNamespace ::]
    set registered [list]
    foreach r [my getAllRegisteredMethods] {
        if {[string range $r 0 1] ne "::"} {
            lappend registered ::$r
        } else {
            lappend registered $r
        }
    }
    ide::lremoveAll allMethods $registered
    return $allMethods
}
