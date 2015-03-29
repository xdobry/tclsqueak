PrsContext instproc parseAndVisit script {
    if {[my parse $script]} {
        [[my parser] root] visit [self]
        my registerSignature
    }
}
