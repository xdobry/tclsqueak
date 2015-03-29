IDE::MenuStruct instproc hasPopdownMenu {} {
    foreach item [my set menuItems] {
        if {[$item popdownMenu]} {return 1}
    }
    return 0
}
