IDE::TCodeCompletion instproc testACodeCompletionLocalCalls {} {
    my checkCompletion {my foo} {foow}
    my checkCompletion {my instva} {instvar}
    my checkCompletionContain {my } {foow}
}
