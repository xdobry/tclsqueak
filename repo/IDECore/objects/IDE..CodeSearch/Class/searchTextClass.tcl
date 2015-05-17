IDE::CodeSearch proc searchTextClass {text class introProxy} {
    set list [list]
    set prefix [$introProxy getMethodTypePrefix]
    foreach proc [$introProxy getClassMethods $class] {
        if {[regexp -- $text [$introProxy getBodyClassMethod $class $proc]]} {
            lappend list "$class ${prefix}class>$proc"
        }
    }
    if {[$introProxy isObjectClass $class]} {
        foreach iproc [$introProxy getInstanceMethods $class] {
            if {[regexp -- $text [$introProxy getBodyInstanceMethod $class $iproc]]} {
                lappend list "$class ${prefix}>$iproc"
            }
        }
    }
    return $list
}
