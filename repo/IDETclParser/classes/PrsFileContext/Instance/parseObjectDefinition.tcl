PrsFileContext instproc parseObjectDefinition script {
    my instvar repository
    set defobj [lindex $script 0]
    set count [llength $script]

    if {$defobj in {::xotcl::Class Class}} {
        set cobject [lindex $script 1]
        set defstart 2
        if {$cobject eq "create"} {
            set cobject [lindex $script 2]
            set defstart 3
        }
        if {$cobject eq ""} {
            return
        }
        set superclasses ""
        set parameters ""
        for {set i $defstart} {$i<$count} {incr i} {
            set elem [lindex $script $i]
            if {$elem eq "-superclasses"} {
                incr i
                set superclasses [lindex $script $i]
            } elseif {$elem eq "-parameters"} {
                incr i
                set parameters [lindex $script $i]
            }
        }

    }

}
