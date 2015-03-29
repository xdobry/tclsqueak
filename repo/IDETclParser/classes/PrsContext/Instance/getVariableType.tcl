PrsContext instproc getVariableType variable {
    my instvar varArr
    if {[catch {set varArr($variable)} desc]} {
        return [list unknown]
    } else {
        return [lindex $desc 0]
    }
}
