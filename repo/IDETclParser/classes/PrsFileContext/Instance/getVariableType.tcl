PrsFileContext instproc getVariableType variable {
    my instvar isTclGlobalScript repository namespace
    if {$isTclGlobalScript} {
        set rtype [$repository getVariableType {} global $variable $namespace]
        if {$rtype ne ""} {
            return $rtype
        }
    }
    next
}
