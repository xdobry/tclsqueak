PrsQuoted instproc canAssignTypeBase type {
    set type0 [lindex $type 0]
    if {$type0 eq "tk" ||  ($type0 eq "new" && [lindex $type 1] eq "tk")} {
        set literal [my getLiteralAfterVariable]
        if {[regexp {^\.[_a-z]} $literal]} {
            return 1
        }
    } elseif {$type eq "index"} {
        # resolve situation as $a+$b or [...]+$a end+$a ....
        set pattern [my prsString]
        set mask [string repeat x [string length $pattern]]
        my instvar list begin end
        if {[info exists list]} {
            foreach l $list {
                set lbegin [expr {[$l set begin]-$begin}]
                set lend [expr {[$l set end]-$begin}]
                set pattern [string replace $pattern $lbegin $lend [string range $mask 0 $lend-$lbegin]]
            }
            if {[regexp {(^end[+-](x+|\d+)$)|(^(x+|\d+)[+-](x+|\d+)$)} $pattern]} {
                return 1
            }
        }
    }
    return 0
}
