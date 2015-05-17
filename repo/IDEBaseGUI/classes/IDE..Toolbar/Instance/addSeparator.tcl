IDE::Toolbar instproc addSeparator {{pos 1.0}} {
    my instvar win count
    ttk::separator $win.sep$count -orient vertical
    my addWin $win.sep$count $pos
    incr count
}
