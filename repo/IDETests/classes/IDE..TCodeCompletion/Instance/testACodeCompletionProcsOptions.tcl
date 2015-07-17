IDE::TCodeCompletion instproc testACodeCompletionProcsOptions {} {
    #my checkCompletion {unset -} {-nocomplain}
    #my checkCompletion {glob -di} {-directory}
    my checkCompletion {glob -tails -di} {-directory}
    my checkCompletion {package require -ex} {-exact}
    my checkCompletion {text .t -fo} {-font}
    my checkCompletion {text $w.t -width 10 -fo} {-font}
    
}
