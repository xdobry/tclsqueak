PrsContext instproc parseGlobal script {
    my instvar parser stream isTclGlobalScript rootCommand
    #ttc vartype parser xotcl ::TclParser
    set isTclGlobalScript 1
    my initParser $script
    set rootCommand [PrsScript new -childof $parser -begin [$stream pos] -end [$stream lastpos]]
    $parser root $rootCommand
    if {![$parser catchParseErrors {$rootCommand evalContents}]} {
        if {[$parser exists parseErrors]} {
            set lerror [lindex [$parser set parseErrors] end]
            my lappend errors [list [$rootCommand begin] [lindex $lerror 0] [lindex $lerror end]]
        }
    } else {
        $rootCommand visit [self]
    }
    #my halt
}
