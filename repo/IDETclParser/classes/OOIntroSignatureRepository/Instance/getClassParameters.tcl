OOIntroSignatureRepository instproc getClassParameters {class namespace} {
    if {[info object isa object $class] && [info object isa class $class]} {
        return [info class variables $class]
    } else {
        return
    }
}
