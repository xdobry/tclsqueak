IDE::TCore instproc testAAPreCreate {} {
    if {[ide::lcontain [IDE::Component getComponentNames] TestCase]} {
        my stopTesting
        error "TestCase should not exists"
    }
    if {[IDE::Component getCompObjectForNameIfExist TestCase] ne ""} {
        my stopTesting
        error "TestCase should not exists"
    }
    set introProxy [IDE::XOIntroProxy getIntroProxy]
    if {"TestCase" in [$introProxy getComponents]} {
        my stopTesting
        error "TestCase should not exists"
    }
    if {[info procs ::testProc] ne ""} {
        my stopTesting
        error "proc testProc should not exists"
    }
    my checkNoSampleObjects
    my checkNoSampleTclProcsGroup
}
