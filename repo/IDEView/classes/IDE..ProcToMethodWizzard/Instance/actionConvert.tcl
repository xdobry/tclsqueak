IDE::ProcToMethodWizzard instproc actionConvert {} {
    my instvar targetClass procedures convertInnerCalls deleteAfterConvert
    if {$targetClass eq ""} {
        IDE::Dialog error "Choose the target class first"
        return
    }
    set innerMethods [list]
    # procedures are without leading ::
    # add with full namespace name
    foreach p $procedures {
        lappend innerMethods ::$p
    }
    foreach p $procedures {
        lappend innerMethods $p
    }
    foreach p $procedures {
        if {[string first :: $p]>=0} {
            lappend innerMethods [namespace tail $p]
        }
    }
    set introProxy [IDE::XOIntroProxy getIntroProxy]
    foreach p $procedures {
        set body [$introProxy getBodyTclMethod $p]
        if {$body eq ""} continue
        set method [namespace tail $p]
        if {[$targetClass info instprocs $method] ne ""} continue
        set method_body [lindex $body 3]
        if {$convertInnerCalls} {
            foreach pname $innerMethods {
                regsub -all -line "^(\\s*)$pname\\M" $method_body "\\1my [namespace tail $pname]" method_body
                regsub -all -line "\\\[$pname\\M" $method_body "\[my [namespace tail $pname]" method_body
                # regsub -all "\\m$pname\\M" $method_body "my [namespace tail $pname]" method_body
            }
        }
        namespace eval :: $targetClass instproc $method [list [lindex $body 2]] \{$method_body\}
        if {$deleteAfterConvert} {
            set pobj [IDE::TclProcsDescription getMethodFor $p]
            if {$pobj ne ""} {
                [$pobj getGroupObj] removeMethodObj $pobj
            }
        }
    }
    my destroy
}
