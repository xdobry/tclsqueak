IDE::CodeSearch proc searchObject searchDict {
    if {[dict get $searchDict type] eq "implementors"} {
        return [my searchImplementorsObject [dict get $searchDict text] [dict get $searchDict context] [dict get $searchDict introProxy]]
    }
    set introProxy [dict get $searchDict introProxy]
    set class [dict get $searchDict context]
    set list [list]
    set prefix [$introProxy getMethodTypePrefix]
    foreach proc [$introProxy getClassMethods $class] {
        if {[my searchText [$introProxy getBodyPartForTextSearch [$introProxy getBodyClassMethod $class $proc]] $searchDict]} {
            lappend list "$class ${prefix}class>$proc"
        }
    }
    if {[$introProxy isObjectClass $class]} {
        foreach iproc [$introProxy getInstanceMethods $class] {
            if {[my searchText [$introProxy getBodyPartForTextSearch [$introProxy getBodyInstanceMethod $class $iproc]] $searchDict]} {
                lappend list "$class ${prefix}>$iproc"
            }
        }
    }
    return $list
}
