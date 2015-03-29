IDE::MethodBrowser proc searchTextComponent {text component {title {}}} {
    if {$title eq ""} {
        set title $text
    }
    set list {}
    if {![my checkRegExprWithDialog $text]} return
    set cobj [IDE::Component getCompObjectForNameIfExist $component]
    if {$cobj eq ""} return
    set introProxy [$cobj getIntroProxy]
    set prefix [$introProxy getMethodTypePrefix]
    foreach pobj [$cobj getProcsGroupsObjects] {
        foreach proc [$pobj getProcsNames] {
            if {[regexp -- $text [info body ::$proc]]} {
                lappend list "proc $proc"
            }
        }
    }
    foreach obj [$cobj getObjects] {
        foreach proc [$introProxy getClassMethods $obj] {
            if {[regexp -- $text [$introProxy getBodyClassMethod $obj $proc]]} {
                lappend list "$obj ${prefix}class>$proc"
            }
        }
    }
    foreach obj [$cobj getClasses] {
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
    if {$list ne {}} {
        set obj [my newBrowserList $list [string range $title 0 15]]
        $obj setSearchString $text
    } else {
        my emptySearchResult
    }
}
