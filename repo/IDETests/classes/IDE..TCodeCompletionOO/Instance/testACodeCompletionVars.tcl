IDE::TCodeCompletionOO instproc testACodeCompletionVars {} {
    my checkCompletion {puts $} {a b c ivar2 cvar}
    my checkCompletion {puts $i} {ivar2}
    my checkCompletion {global g1 g2
       puts $} {a b c ivar2 g1 g2 cvar}
}
