IDE::ProcsGroupPer instproc rename name {
    if {![my questForChange]} return
    next
    my updateAttributes name
}
