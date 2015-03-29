IDE::AbstractClassView instproc trackClass actual {
    if {[Object isclass $actual]} {
        IDE::MethodTracker registerClassForTracking [self]
    } else {
        IDE::Dialog error "I can track only classes"
    }
}
