IDE::DialogHelper instproc actionOk {} {
    update idletasks
    if {[my checkOk]} {
        my set userAction ok
        my postOk
        my signalFree
    }
}
