OOIntroSignatureRepository instproc getClassSuperclassesFromFullName fullName {
    if {[info object isa object $fullName] && [info object isa class $fullName]} {
        info class superclasses $fullName
    } else {
        return
    }
}
