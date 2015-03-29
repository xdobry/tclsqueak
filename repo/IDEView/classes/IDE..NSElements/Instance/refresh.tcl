IDE::NSElements instproc refresh item {
    my instvar vnamespace
    if {$vnamespace ne ""} {
        my selectFor $vnamespace
    }
}
