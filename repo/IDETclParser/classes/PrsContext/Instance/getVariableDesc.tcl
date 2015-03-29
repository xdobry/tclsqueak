PrsContext instproc getVariableDesc variable {
    my instvar varArr
    if {[catch {set varArr($variable)} desc]} {
        return [list unknown local]
    } else {
        return $desc
    }
}
