proc ide::lappendIfNone {list_ref elem} {
    upvar $list_ref list
    if {![lcontain $list $elem]} {
        lappend list $elem
        return 1
    }
    
    return 0
}
