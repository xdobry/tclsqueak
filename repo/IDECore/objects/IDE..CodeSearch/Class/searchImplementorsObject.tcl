IDE::CodeSearch proc searchImplementorsObject {implementor obj introProxy} {
    set list [list]
    set prefix [$introProxy getMethodTypePrefix]
    if {$implementor in [$introProxy getClassMethods $obj]} {
        lappend list "$obj ${prefix}class>$implementor"
    }
    if {[$introProxy isObjectClass $obj]} {
        if {$implementor in [$introProxy getInstanceMethods $obj]} {
            lappend list "$obj ${prefix}>$implementor"
        }
    }
    return $list
}
