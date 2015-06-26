PrsElement instproc getAsList {} {
    if {[my exists list] && [llength [my set list]]>0} {
        return [my set list]
    } else {
        set content [my prsContentString]
        # warning { } is still empty list
        if {[string trim $content] ne ""} {
            return [list [self]]
        } else {
            return [list]
        }
    }
}
