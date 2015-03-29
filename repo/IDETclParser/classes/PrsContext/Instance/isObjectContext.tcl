PrsContext instproc isObjectContext {} {
    my instvar isTclproc isTclGlobalScript
    expr {$isTclproc || ([info exists isTclGlobalScript] && !$isTclGlobalScript)}
}
