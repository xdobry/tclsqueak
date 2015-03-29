PrsContext instproc checkComment {comment notifier} {
    foreach {all type value} [regexp -all -inline -linestop {#ttc (vartype|rettype) (.+)} [$comment prsString]] {
        if {$type eq "vartype"} {
            if {[regexp {(\S+)\s(.+)} $value _ varname vartype]} {
                tlog::info "adding ttc variable $varname type=$vartype"
                my addVariable $varname $comment $notifier $vartype local 1
            }
        } elseif {$type eq "rettype"} {
            tlog::info "seting rettype to $value"
            my set forceRetType $value
        } elseif {$type eq "varrefref"} {
            my set varrefref 1
        }
    }
}
