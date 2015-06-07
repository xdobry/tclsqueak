IDE::NSElements instproc refresh {} {
    my instvar vnamespace
    if {$vnamespace ne ""} {
        my selectFor $vnamespace
    }
}
