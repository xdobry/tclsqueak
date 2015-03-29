IDE::ObjectDescription instproc initObject {} {
    set introProxy [my getCompIntroProxy]
    if {"initializeAfterLoad" in [$introProxy getClassMethods [my getObjectName]]} {
        if {[catch "[my getObjectName] initializeAfterLoad"]} {
            global errorInfo
            IDE::Dialog error "error by calling [my getObjectName] initializeAfterLoad $errorInfo"
        }
    }
}
