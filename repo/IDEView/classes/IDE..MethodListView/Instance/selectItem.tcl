IDE::MethodListView instproc selectItem item {
    if {$item eq ""} return
    lassign [IDE::XOIntroProxy getDescFromDisplayItem $item] class vtype method
    my selectClassTypeMethod $class $vtype $method
    [my info parent] colorizeSearchString
}
