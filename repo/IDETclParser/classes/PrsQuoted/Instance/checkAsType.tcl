PrsQuoted instproc checkAsType {rtype context notifier} {
    set ret [next]
    if {$ret==1 && $rtype eq "index"} {
        my instvar list
        if {[info exists list]} {
            foreach l $list {
                $l checkAsType int $context $notifier
            }
        }
    }
    return $ret
}
