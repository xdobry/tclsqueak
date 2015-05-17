IDE::CodeSearch proc searchTextComponent {text component} {
    set list [list]
    set cobj [IDE::Component getCompObjectForNameIfExist $component]
    if {$cobj eq ""} return
    set introProxy [$cobj getIntroProxy]
    set prefix [$introProxy getMethodTypePrefix]
    foreach pobj [$cobj getProcsGroupsObjects] {
        foreach proc [$pobj getProcsNames] {
            if {[regexp -- $text [$introProxy getProcBody $proc]]} {
                lappend list "proc $proc"
            }
        }
    }
    foreach obj [$cobj getObjects] {
        lappend list {*}[my searchTextClass $text $obj $introProxy]
    }
    foreach class [$cobj getClasses] {
        lappend list {*}[my searchTextClass $text $class $introProxy]
    }
    return $list
}
