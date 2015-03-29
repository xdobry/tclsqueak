IDE::MenuStruct instproc migrateTkMenu {} {
    # TODO probably obsolete
    foreach item [my set menuItems] {
        $item migrateTkMenu
    }
}
