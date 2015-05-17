IDE::CodeSearch proc searchImplementorsComponent {implementor component} {
    set list [list]
    set cobj [IDE::Component getCompObjectForNameIfExist $component]
    if {$cobj eq ""} {
        return $list
    }
    set introProxy [$cobj getIntroProxy]
    set prefix [$introProxy getMethodTypePrefix]
    foreach pobj [$cobj getProcsGroupsObjects] {
        set procNames [$pobj getProcsNames]
        if {$implementor in $procNames} {
            lappend list "proc $implementor"
        }
        if {[string first :: $implementor]<0} {
            foreach pName $procNames {
                if {[namespace tail $pName] eq $implementor} {
                    lappend list "proc $pName"
                }
            }
        }
    }

    foreach obj [$cobj getObjects] {
        if {$implementor in [$introProxy getClassMethods $obj]} {
            lappend list "$obj ${prefix}class>$implementor"
        }
    }
    foreach obj [$cobj getClasses] {
        if {$implementor in [$introProxy getClassMethods $obj]} {
            lappend list "$obj ${prefix}class>$implementor"
        }
        if {$implementor in [$introProxy getInstanceMethods $obj]} {
            lappend list "$obj ${prefix}>$implementor"
        }
    }
    return $list
}
