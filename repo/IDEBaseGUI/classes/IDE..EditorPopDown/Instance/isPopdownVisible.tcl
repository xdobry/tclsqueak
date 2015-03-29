IDE::EditorPopDown instproc isPopdownVisible {} {
    my instvar dropWin
    if {![my exists dropWin]} {
        return [wm ismapped $dropWin]
    }
    return 0
}
