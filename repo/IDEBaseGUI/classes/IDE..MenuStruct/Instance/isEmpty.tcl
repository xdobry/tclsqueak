IDE::MenuStruct instproc isEmpty {} {
    return [expr {![my exists menuItems]}]
}
