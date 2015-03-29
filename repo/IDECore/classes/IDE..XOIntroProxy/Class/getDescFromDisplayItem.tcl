IDE::XOIntroProxy proc getDescFromDisplayItem item {
    if {$item eq ""} return
    if {[lindex $item 0] eq "proc"} {
        set method [lindex $item 1]
        set vtype "Procs"
        set class [IDE::TclProcsDescription getMethodFor [string trimleft $method :]]
        if {$class ne ""} {
            set class [$class getGroupObj]
        }
    } else {
        set item [split $item >]
        set method [lindex $item 1]
        set type [lindex $item 0 1]
        if {[string index $type 0] eq "("} {
            set type [lindex $item 0 2]
        }
        switch $type {
            {} {
                set vtype Instance
            }
            class {
                set vtype Class
            }
            oo {
                set vtype OOInstance
            }
            ooclass {
                set vtype OOClass
            }
            default {
                set vtype Class
            }
        }
        set class [string trimleft [lindex [lindex $item 0] 0] :]
    }
    list $class $vtype $method
}
