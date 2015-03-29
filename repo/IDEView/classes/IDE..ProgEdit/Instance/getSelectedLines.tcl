IDE::ProgEdit instproc getSelectedLines {} {
    set twin [my getTextWindow]
    set range [$twin tag ranges sel]
    if {$range eq ""} {
        set cursor [$twin index insert]
        set line [lindex [split $cursor .] 0]
        return [list $line $line]
    } else {
        return [list [lindex [split [lindex $range 0] .] 0]  [lindex [split [lindex $range 1] .] 0]]
    }
}
