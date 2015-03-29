IDE::DialogHelper instproc actionCancel {} {
    update idletasks
    my set userAction cancel
    my postCancel
    my signalFree
}
