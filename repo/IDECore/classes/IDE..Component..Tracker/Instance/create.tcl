IDE::Component::Tracker instproc create {cls args} {
    next
    if {[namespace tail $cls] ne "slot"} {
        IDE::Component registerObject $cls
        if {[Object ismetaclass $cls]} {
            [self class] trackClass $cls
        }
    }
}
