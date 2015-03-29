IDE::DialogHelper instproc actionStop {} {
    update idletasks
    my set userAction stop
    my postCancel
    my signalFree
}
