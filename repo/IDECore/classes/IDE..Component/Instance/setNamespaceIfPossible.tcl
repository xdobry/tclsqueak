IDE::Component instproc setNamespaceIfPossible ns {
    my instvar objects classes namespace
    if {[llength $objects]==0 && [llength $classes]==0} {
        set namespace $ns
        return 1
    } else {
        if {[my getNamespace] eq $ns} {
            return 1
        }
    }
    return 0
}
