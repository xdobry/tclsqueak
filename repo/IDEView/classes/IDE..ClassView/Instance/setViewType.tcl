IDE::ClassView instproc setViewType type {
    my @stateButton setState $type
    my changeViewType $type
}
