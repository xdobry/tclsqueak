IDE::CodeSearch proc searchTypeUsage type {
    my search [dict create text "$type\[\[:>:\]\]" scope all type text]
}
