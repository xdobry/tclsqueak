IDE::TclModeEdit proc initializeAfterLoad {} {
    IDE::TclModeEdit instmixin add IDE::MethodEditSynchronizatorMix
}
