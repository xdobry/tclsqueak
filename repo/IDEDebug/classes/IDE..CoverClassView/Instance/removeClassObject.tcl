IDE::CoverClassView instproc removeClassObject {} {
    my instvar vclass
    if {[Object isclass $vclass]} {
       IDE::MethodTracker unregisterClassForTracking $vclass
    } else {
       IDE::MethodTracker unregisterObjectForTracking $vclass
    }
    my resetResults
    my refreshBaseView
}
