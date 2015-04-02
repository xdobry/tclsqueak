IDE::ObjectDescription instproc proc {procname arguments body args} {
    if {[self callingproc] ni {initFromDB evalBody}} {
        if {![[self]::description questForChange]} return
    }
    next
    if {[self callingproc] eq {initFromDB evalBody}} return
    if {$body eq ""} {
        [self]::description deleteClassMethod $procname
    } else {
        [self]::description registerClassMethod $procname
    }
    return
}
