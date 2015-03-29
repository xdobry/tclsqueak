IDE::Component instproc saveAsScript {{file {}} {nometa 0}} {
    if {$file eq ""} {
        set file [my standardFileName]
    }
    set of [open $file w]
    puts $of [my asScript $nometa]
    close $of
}
