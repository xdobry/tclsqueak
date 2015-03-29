IDEDBConnectDialog instproc suspendUntilSignal {} {
     my makeModelessDialog
     global dialogSemaphore
     vwait dialogSemaphore
}
