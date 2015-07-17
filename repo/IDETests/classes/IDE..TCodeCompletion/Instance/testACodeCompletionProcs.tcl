IDE::TCodeCompletion instproc testACodeCompletionProcs {} {
    my checkCompletion {put} {puts}
    my checkCompletion {info compl} {complete}
    my checkCompletionContain {info } {complete}
}
