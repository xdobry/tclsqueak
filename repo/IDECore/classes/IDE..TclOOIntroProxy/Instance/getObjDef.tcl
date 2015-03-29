IDE::TclOOIntroProxy instproc getObjDef name {
    set script [my getBaseObjDef $name]
    if {[info object isa class $name]} {
        set sl [info class superclasses $name]
        set def ""
        if {$sl ne "" && $sl ne "::oo::object"} {
            append def "    superclass $sl\n"
        }
        set pr [info class variables $name]
        if {[llength $pr]>0} {
            append def "    variable $pr\n"
        }
        if {$def ne ""} {
            append script " {\n$def}\n"
        } else {
            append script \n
        }
    } else {
        append script "\n"
    }
    return $script
}
