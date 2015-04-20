PrsContext instproc visit obj {
    set parser [my parser]
    if {![$parser catchParseErrors {$obj checkSyntax [self] [self]}]} {
        if {[$parser exists parseErrors]} {
            my lappend errors [lindex [$parser set parseErrors] end]
        }
    }
}
