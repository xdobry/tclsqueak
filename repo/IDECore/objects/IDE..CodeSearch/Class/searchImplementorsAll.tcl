IDE::CodeSearch proc searchImplementorsAll {implementor {nocomplain 0}} {
    my search [dict create text $implementor type implementors scope all]
}
