IDE::BreakpointFasade instproc remove {} {
    my signalEvent remove [self]
    my instvar vctype vclass
    if {$vctype eq "Procs" || $vctype eq "Procs"} {
        trace remove execution ::[my method] enter ::idevarstrack::invokeMethodDebugger
    } elseif {$vctype eq "Instance"} {
        if {[Object isobject $vclass]} {
            set mixin [self]::DebugMix
            $vclass instmixin delete $mixin
        }
    } elseif {$vctype eq "Class"} {
        if {[Object isobject $vclass]} {
            set mixin [self]::DebugMix
            if {[$vclass ismixin $mixin]} {
                $vclass mixin delete $mixin
            }
        }
    }
    [self class] removeBreakpoint [self]
    my destroy
}
