IDE::Component::Tracker instproc proc {proc args} {
    IDE::Component registerProc $proc
    next
}
