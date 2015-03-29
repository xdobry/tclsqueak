IDE::NSView instproc getTextForItem ns {
    if {$ns eq "::"} {
        return $ns
    } else {
        namespace tail $ns
    }
}
