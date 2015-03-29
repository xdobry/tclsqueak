IDE::TclOOIntroProxy instproc parseClassDefinition body {
    set superclasses [list]
    set variables [list]
    set defbody [lindex $body end]
    # not real parse
    foreach line [split $defbody \n] {
        set first [lindex $line 0]
        switch -- $first {
            superclasses {
                set superclasses [lrange $line 1 end]
            }
            var {
                set variables [lrange $line 1 end]
            }
        }
    }
    list $superclasses $variables
}
