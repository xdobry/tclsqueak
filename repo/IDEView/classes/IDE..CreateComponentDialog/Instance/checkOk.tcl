IDE::CreateComponentDialog instproc checkOk {} {
    my instvar name userMsg
    if {![regexp {^[\w:]+$} $name]} {
        if {$name eq ""} {
            set userMsg "enter component name"
        } else {
            set userMsg "wrong component name. Use only characters"
        }
        return 0
    }
    # TODO check also namespace
    return 1
}
