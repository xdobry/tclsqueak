IDE::MenuStruct instproc addMenuItem menuItem {
    my lappend menuItems $menuItem
    return $menuItem
}
