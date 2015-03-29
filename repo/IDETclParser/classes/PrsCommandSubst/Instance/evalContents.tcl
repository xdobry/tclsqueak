PrsCommandSubst instproc evalContents {} {
    my instvar lastCommand list
    my basicEvalContents
    if {[info exists list]} {
        foreach e [lreverse $list] {
            if {[$e hasclass PrsCommand]} {
                set lastCommand $e
                break
            }
        }
    }
}
