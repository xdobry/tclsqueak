IDE::MenuStruct instproc addCascadeMenu menu {
    my addMenuItem $menu
    if {[my exists enablementHandler]} {
        $menu enablementHandler [my set enablementHandler]
    }
}
