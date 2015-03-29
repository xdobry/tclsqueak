IDE::TclModeEdit instproc makeMCGetter {} {
    set twin [my getTextWindow]
    set range [$twin tag ranges sel]
    if {$range ne ""} {
        set b [lindex $range 0]
        set f [lindex $range 1]
        if {[$twin get "$f - 1 char" $f] eq "\}"} {
            $twin delete "$f - 1 char" $f
            $twin insert "$f - 1 char" {"]}
        } elseif {[$twin get "$f - 1 char" $f] ne "\""} {
            $twin insert $f {"]}
        } else {
            $twin insert $f {]}
        }
        if {[$twin get $b "$b + 1 char"] eq "\{"} {
            $twin delete $b  "$b +1 char"
            set mc mc
            $twin insert $b "\[$mc \""
        } elseif {[$twin get $b "$b + 1 char"] ne "\""} {
            set mc mc
            $twin insert $b "\[$mc \""
        } else {
            $twin insert $b {[mc }
        }
    }
}
