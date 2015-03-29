IDE::MenuStruct instproc menuIsMapped win {
    if {![my exists enablementHandler]} return
    my checkEnable $win
}
