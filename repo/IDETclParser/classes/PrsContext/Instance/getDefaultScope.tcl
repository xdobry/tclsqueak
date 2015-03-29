PrsContext instproc getDefaultScope {} {
    my instvar isTclGlobalScript
    # expr {$isTclGlobalScript?"global":"local"}
    if {$isTclGlobalScript} {
        return [list global]
    }
    return [list local]
}
