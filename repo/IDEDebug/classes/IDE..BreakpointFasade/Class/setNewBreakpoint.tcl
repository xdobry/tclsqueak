IDE::BreakpointFasade proc setNewBreakpoint {vctype vclass method {position 0}} {
    my instvar breakpointsArr methodArr breakPointClass
    set bobj [$breakPointClass new -childof [self] [list -vctype $vctype] [list -vclass $vclass] [list -oomethod $method] [list -position $position]]
    set handle [$bobj handle]
    set breakpointsArr($handle) $bobj
    set methodArr([$bobj method]) $handle
    my signalEvent addBreakpoint $bobj
    return $bobj
}
