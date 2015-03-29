IDE::MethodBrowser proc searchTextAll {text {title {}}} {
    if {$title eq ""} {
        set title $text
    }
    set list {}
    if {![my checkRegExprWithDialog $text]} return
    # search in registered/managed tcl procs
    #foreach proc [IDE::TclProcsDescription getAllRegisteredMethods] {
        #if {[regexp -- $text [info body ::$proc]]} {
            #lappend list "proc $proc"
        #}
    #}
    foreach introProxy [IDE::XOIntroProxy getIntroProxies] {
        set prefix [$introProxy getMethodTypePrefix]
        foreach obj [$introProxy getObjects] {
            if {[string trimleft $obj :] in {xotcl::classInfo xotcl::objectInfo xotcl::package package}} {
                continue
            }
            foreach proc [$introProxy getClassMethods $obj] {
                if {[regexp -- $text [$introProxy getBodyClassMethod $obj $proc]]} {
                    lappend list "$obj ${prefix}class>$proc"
                }
            }
        }
        foreach obj [$introProxy getClasses] {
            foreach proc [$introProxy getClassMethods $obj] {
                if {[regexp -- $text [$introProxy getBodyClassMethod $obj $proc]]} {
                    lappend list "$obj ${prefix}class>$proc"
                }
            }
            foreach iproc [$introProxy getInstanceMethods $obj] {
                if {[regexp -- $text [$introProxy getBodyInstanceMethod $obj $iproc]]} {
                    lappend list "$obj ${prefix}>$iproc"
                }
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
