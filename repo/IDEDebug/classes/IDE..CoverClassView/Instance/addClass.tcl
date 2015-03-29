IDE::CoverClassView instproc addClass {} {
    set class [IDE::ClassSelector getClass]
    if {$class eq ""} return
    IDE::MethodTracker registerClassForTracking [$class]
    my refreshBaseView
}
