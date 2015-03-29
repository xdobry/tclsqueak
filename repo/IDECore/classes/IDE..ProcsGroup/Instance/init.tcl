IDE::ProcsGroup instproc init {} {
    if {![my exists withNamespace]} return
    if {[my withNamespace]} {
        my set defBody "namespace eval [list ::[my name]] {}"
        namespace eval :: [my set defBody]
    } else {
        my set defBody {}
    }
}
