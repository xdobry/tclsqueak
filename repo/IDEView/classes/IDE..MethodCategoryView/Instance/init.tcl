IDE::MethodCategoryView instproc init args {
    my instvar vclass win viewtype vobjtype selectAllByDefault
    next
    ::IDE::TabButtons create [self]::stateButton $win.stateBut -states {Instance Class} -command [list [self] changeViewType]
    pack $win.stateBut -anchor w
    set vclass {}
    set vobjtype Instances
    set viewtype Instance
    set selectAllByDefault 1
}
