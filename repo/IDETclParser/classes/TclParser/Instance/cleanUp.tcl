TclParser instproc cleanUp {} {
    my instvar root parseElements
    if {[info exists root] && [Object isobject $root]} {
        $root destroy
        set root {}
    }
    if {[info exists parseElements]} {
        foreach e $parseElements {
            if {[Object isobject $e]} {
                $e destroy
            }
        }
        set parseElements [list]
    }
}
