PrsContext instproc visit obj {
    set parser [my parser]
    if {![$parser catchParseErrors {$obj checkSyntax [self] [self]}]} {
        if {[$parser exists parseErrors]} {
            set lerror [lindex [$parser set parseErrors] end]
            my lappend errors [list [$obj begin] [lindex $lerror 0] [lindex $lerror end]]
        }
    }
}
