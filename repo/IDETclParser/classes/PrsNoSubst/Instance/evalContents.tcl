PrsNoSubst instproc evalContents {} {
    my basicEvalContents
    my instvar list lastCommand
    if {[info exists list]} {
        foreach e [lreverse $list] {
            if {[$e hasclass PrsCommand]} {
                set lastCommand $e
                break
            }
        }
    }
}
