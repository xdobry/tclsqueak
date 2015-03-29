IDE::CoverMethodView instproc init args {
    next
    my instvar win vtype
    my set treeView 0
    IDE::TabButtons create [self]::stateButton $win.tb_class -states {Covered {Not Covered}} -command [list [self] changeViewType]
    my set vtype Covered
    pack $win.tb_class -anchor w
    my set cvtype Covered
}
