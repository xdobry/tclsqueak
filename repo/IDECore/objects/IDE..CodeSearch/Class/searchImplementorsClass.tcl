IDE::CodeSearch proc searchImplementorsClass {implementor class introProxy} {
    set list [list]
    if {[$introProxy isObjectClass $class]} {
        set prefix [$introProxy getMethodTypePrefix]
        foreach obj [concat $class [$introProxy getHeritageFlatPrecedenceForClass $class] [$introProxy getDeepChildrenForClass $class]] {
            if {$implementor in [$introProxy getClassMethods $obj]} {
                lappend list "$obj ${prefix}class>$implementor"
            }
            if {$implementor in [$introProxy getInstanceMethods $obj]} {
                lappend list "$obj ${prefix}>$implementor"
            }
        }
    }
    return $list
}
