PrsITclContext instproc checkVariable {variable {type unknown} {scope {}}} {
    my instvar isTclGlobalScript namespace name repository
    set ret [next]
    if {!$ret && !$isTclGlobalScript} {
        set rtype [$repository getVariableType $name instproc $variable $namespace]
        if {$rtype eq ""} {
            set rtype [$repository getVariableType $name proc $variable $namespace]
        }
        if {$rtype ne ""} {
            set varArr($variable) [list $rtype [list instproc $name]]
            return 1
        }
    }
    return $ret
}
