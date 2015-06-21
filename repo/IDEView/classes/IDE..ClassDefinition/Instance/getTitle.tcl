IDE::ClassDefinition instproc getTitle {} {
    my instvar mode
    if {$mode eq "redefine"} {
        return {Redefine Class}   
    } else {
        return {Create new Class}
    }
}
