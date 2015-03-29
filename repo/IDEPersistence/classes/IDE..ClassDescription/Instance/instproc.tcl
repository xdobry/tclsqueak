IDE::ClassDescription instproc instproc {procname arguments body args} {
    if {[self callingproc] ne "initFromDB"} {
        if {![[my getDescription] questForChange]} return
    }
    next
    if {[self callingproc] eq "initFromDB"} return
    set parameters [list]
    set object [[my getDescription] getObject]
    foreach par [$object info parameter] {
        lappend parameters [lindex $par 0]
    }
    #ignore parameters methods
    if {$procname in $parameters} return
    if {$body eq ""} {
        [my getDescription] deleteInstanceMethod $procname
    } else {
        [my getDescription] registerInstanceMethod $procname
    }
    return
}
