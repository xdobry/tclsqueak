IDE::BreakpointFasade instproc init args {
    my instvar vctype vclass oomethod method handle
    my method [my getMethodForDescriptionList]
    if {$vctype eq "Procs" || $vctype eq "Tcl Procs"} {
        trace add execution ::$method enter ::idevarstrack::invokeMethodDebugger
    } elseif {$vctype eq "Instance"} {
        set mixclass [Class [self]::DebugMix]
        $mixclass instproc $oomethod {args} {
            IDE::Debugger startDebugging "entering [self next]"
            next
        }
        $vclass instmixin add $mixclass
    } elseif {$vctype eq "Class"} {
        set mixclass [Class [self]::DebugMix]
        $mixclass instproc $oomethod {args} {
            IDE::Debugger startDebugging "entering [self next]"
            next
        }
        $vclass mixin add $mixclass
    }
    set handle $method

}
