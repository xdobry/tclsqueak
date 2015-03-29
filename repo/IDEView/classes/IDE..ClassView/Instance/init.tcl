IDE::ClassView instproc init args {
    next
    my instvar win vtype
    my set treeView 0
    ::IDE::TabButtons create [self]::@stateButton $win.tb_class -states {Classes Objects Procs} -command [list [self] changeViewType]
    set vtype Classes
    pack $win.tb_class -anchor w
}
