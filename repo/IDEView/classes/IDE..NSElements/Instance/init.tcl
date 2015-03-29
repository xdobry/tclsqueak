IDE::NSElements instproc init args {
    next
    my instvar win vtype
    ::IDE::TabButtons create [self]::@stateButton $win.tb_class -states {Procs Vars Classes Objects Imports Exports} -command [list [self] changeViewType]
    set vtype Procs
    pack $win.tb_class -anchor w
}
