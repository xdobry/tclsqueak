PrsQuoted instproc getStringSubType {} {
    set content [my prsContentString]
    if {$content eq ""} {
        return empty
    }
    return
}
