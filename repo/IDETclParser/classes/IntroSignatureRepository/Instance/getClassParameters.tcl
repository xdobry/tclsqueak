IntroSignatureRepository instproc getClassParameters {class namespace} {
    if {[Object isclass $class]} {
        $class info parameter
    } else {
        return
    }
}
