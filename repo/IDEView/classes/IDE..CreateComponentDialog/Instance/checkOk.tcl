IDE::CreateComponentDialog instproc checkOk {} {
    my instvar name userMsg namespace
    if {![regexp {^[\w:]+$} $name]} {
        if {$name eq ""} {
            set userMsg "enter component name"
        } else {
            set userMsg "wrong component name. Use only characters"
        }
        return 0
    }
    if {$namespace ne "" && ![regexp {^[\w:]+$} $namespace]} {
        set userMsg "wrong namesapce. Use only characters and ::"
        return 0
    }
    # TODO check also namespace
    return 1
}
