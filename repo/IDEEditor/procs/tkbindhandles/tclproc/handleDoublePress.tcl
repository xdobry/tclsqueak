proc handleDoublePress object {
    if {[$object doubleButton]} {
        return -code break
    }
}
