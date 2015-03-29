IDE::StateButtonActivity instproc init window {
    next
    my instvar win unactiveColor
    set unactiveColor [$win cget -bg]
}
