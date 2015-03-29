PrsContext instproc checkVariable {variable {type unknown} {scope {}}} {
    my instvar varArr repository namespace
    if {[info exists varArr($variable)]} {
        return 1
    } else {
        if {[string first :: $variable]>=0 || $scope eq "global"} {
            set rtype [$repository getVariableType {} global $variable $namespace]
            if {$rtype ne ""} {
                set varArr($variable) [list $rtype global]
                return 1
            }
        }
    }
    return 0
}
