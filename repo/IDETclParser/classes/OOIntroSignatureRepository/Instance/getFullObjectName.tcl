OOIntroSignatureRepository instproc getFullObjectName {object namespace} {
    if {$namespace eq ""} {
        set fn [namespace which $object]
    } else {
        set fn [namespace eval $namespace [list namespace which $object]]
    }
    if {$fn eq ""} {
        return $object
    } else {
        return $fn
    }
}
