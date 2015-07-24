IDE::GlobalVarsView instproc init window {
    next
    my instvar win
    my set treeView 0
    frame $win.fframe
    label $win.fframe.lfilter -text Filter
    entry $win.fframe.efilter
    $win.fframe.efilter insert 0 *
    button $win.fframe.filter -text Refresh -command [list [self] refresh]
    pack $win.fframe.lfilter $win.fframe.efilter $win.fframe.filter -side left
    pack $win.fframe -anchor w
    bind $win.fframe.efilter <Return> [list [self] refresh]
}
