IDE::TCodeCompletionOO instproc testACodeCompletionLocalCalls {} {
    my checkCompletion {my foo} {foow}
    my checkCompletion {my variabl} {variable}
    my checkCompletionContain {my } {foow}
}
