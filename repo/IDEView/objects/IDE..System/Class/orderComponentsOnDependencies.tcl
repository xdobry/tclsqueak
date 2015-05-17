IDE::System proc orderComponentsOnDependencies components {
    set rcomps [list]
    foreach c $components {
        set crcomps [my getRequiredComponentsForRek $c $components $rcomps]
        if {[llength $crcomps]>0} {
            lappend rcomps {*}$crcomps
        }
    }
    return $rcomps
}
