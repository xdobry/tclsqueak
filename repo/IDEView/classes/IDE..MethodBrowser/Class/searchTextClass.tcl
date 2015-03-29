IDE::MethodBrowser proc searchTextClass {text class title introProxy} {
    if {$title eq ""} {
        set title $text
    }
    set list {}
    if {![my checkRegExprWithDialog $text]} return
    set prefix [$introProxy getMethodTypePrefix]

    foreach proc [$introProxy getClassMethods $class] {
        if {[regexp -- $text [$introProxy getBodyClassMethod $class $proc]]} {
            lappend list "$class class>$proc"
        }
    }
    if {[$introProxy isObjectClass $class]} {
        foreach iproc [$introProxy getInstanceMethods $class] {
            if {[regexp -- $text [$introProxy getBodyInstanceMethod $class $iproc]]} {
                lappend list "$class>$iproc"
            }
        }
    }
    if {[llength $list]>0} {
        set obj [my newBrowserList $list [string range $title 0 15]]
        $obj setSearchString $text
    } else {
        my emptySearchResult
    }
}
