IDE::MethodEdit instproc changeViewType type {
    my instvar vtype controler
    set vtype $type
    if {[my exists controler] && [Object isobject $controler]} {
        $controler refreshView
    }
}
