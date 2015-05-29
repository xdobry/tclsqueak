IDE::CodeSearch proc searchComponent searchDict {
    set list [list]
    set compName [dict get $searchDict context]
    if {$compName eq "xotcl::package"} {
        return $list
    }
    set cobj [IDE::Component getCompObjectForNameIfExist $compName]
    if {$cobj eq ""} {
        return $list
    }
    set introProxy [$cobj getIntroProxy]
    foreach pobj [$cobj getProcsGroupsObjects] {
        lappend list {*}[my searchProcGroup $pobj $searchDict]
    }
    set subDict $searchDict
    dict set subDict scope Object
    dict set subDict introProxy $introProxy
    foreach obj [$cobj getObjects] {
        dict set subDict context $obj
        lappend list {*}[my searchObject $subDict]
    }
    foreach class [$cobj getClasses] {
        dict set subDict context $class
        lappend list {*}[my searchObject $subDict]
    }
    return $list
}
