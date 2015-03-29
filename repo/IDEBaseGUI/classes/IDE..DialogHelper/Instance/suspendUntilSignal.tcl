IDE::DialogHelper instproc suspendUntilSignal {} {
    my makeModelessDialog
    my instvar dialogSemaphore
    set dialogSemaphore 0
    my vwait dialogSemaphore
    #puts "after semaphore [self]"
    my cleanUpAfterSignal
}
