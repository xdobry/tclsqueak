IDE::InterpView instproc buttonDoublePush {} {
    set si [my selectedItem]
    if {$si ne ""} {
        my browserInterp $si
    }
}
