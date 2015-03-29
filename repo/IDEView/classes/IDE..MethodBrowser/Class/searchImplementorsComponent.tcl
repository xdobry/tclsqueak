IDE::MethodBrowser proc searchImplementorsComponent {implementor component} {
    set list {}
    set cobj [IDE::Component getCompObjectForNameIfExist $component]
    if {$cobj eq ""} return
    set introProxy [$cobj getIntroProxy]
    set prefix [$introProxy getMethodTypePrefix]
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
    if {[llength $list]>0} {
        my newBrowserList $list $implementor
    } else {
        my emptySearchResult
    }
}
