IDE::TclKitDeployer instproc deploy desc {
    if {![dict exists $desc type]} {
        error "no depoyment type found"
    }
    if {[dict get $desc type] ni {kit win linux}} {
        error "unsuported deployment type for kit depoyer: [dict get $desc type]"
    }
    if {[dict get $desc type] in {win linux}} {
        if {![dict exists $desc kitexe]} {
            error "attribute kitexe not found in deployment description"
        }
        if {![file exists [dict get $desc kitexe]]} {
            error "file [dict get $desc kitexe] not found"
        }
    }
    next
}
