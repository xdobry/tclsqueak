IntroSignatureRepository instproc getClassSuperclassesFromFullName fullName {
    if {[Object isclass $fullName]} {
        return [$fullName info superclass]
    } else {
        return
    }
}
