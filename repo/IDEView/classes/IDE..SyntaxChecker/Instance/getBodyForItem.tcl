IDE::SyntaxChecker instproc getBodyForItem item {
    if {[lindex $item 0] eq "proc"} {
        return [IDE::IntroProxy getProcBody [lindex $item 1]]
    } else {
        set item [split $item >]
        set method [lindex $item 1]
        set vtype [lindex [lindex $item 0] 1]
        if {$vtype eq ""} { set vtype Instance} else { set vtype Class}
        set vclass [lindex [lindex $item 0] 0]
        return [IDE::IntroProxy getBody${vtype}Method $vclass $method]
    }
}
