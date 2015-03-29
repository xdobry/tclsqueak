PrsFileContext instproc checkVariable {variable {type unknown} {scope {}}} {
    my instvar repository varArr namespace
    if {[next]} {
        return 1
    } else {
        set scope [my getDefaultScope]
        if {$scope eq "global"} {
            set rtype [$repository getVariableType {} global $variable $namespace]
            if {$rtype ne ""} {
                set varArr($variable) [list $rtype global]
                return 1
            }
        }
        return 0
    }
}
