IDE::ObjectDescription instproc proc {procname arguments body args} {
    if {[self callingproc] ne "initFromDB"} {
        if {![[self]::description questForChange]} return
    }
    next
    if {[self callingproc] eq "initFromDB"} return
    if {$body eq ""} {
        [self]::description deleteClassMethod $procname
    } else {
        [self]::description registerClassMethod $procname
    }
    return
}
