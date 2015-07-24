IDE::TCodeCompletion instproc testACodeCompletionVars {} {
    my checkCompletion {puts $} {a b c ivar2}
    my checkCompletion {puts $i} {ivar2}
    my checkCompletion {global g1 g2
       puts $} {a b c ivar2 g1 g2}
    my checkCompletion {global g1 g2
       puts $g} {g1 g2}
    my checkCompletion {puts $newvar
       puts $new} {newvar}
    my checkCompletion {puts $::tcl_ver} {::tcl_version}
    my checkCompletion {puts $::tcodecomplation::testns::mynsv} {::tcodecomplation::testns::mynsvar}
    
}
