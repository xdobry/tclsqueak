PrsContext instproc parseAndCheckCommand command {
    my instvar rootCommand parser errors

    set script [$command prsString]
    set rootCommand $command
    set parser [$command getParser]

    if {[my parseCommand]} {
        [[my parser] root] visit [self]
        my registerSignature
    }
    if {[string first "no syntax check" $script]>=0} {
        set errors [list]
    }

}
