IDE::TCodeCompletionOO instproc testACodeCompletionClassCalls {} {
    my checkCompletion {CodeCompletionTestCla} {CodeCompletionTestClass}
    my checkCompletion {CodeCompletionTestClass ne} {new}
    my checkCompletion {CodeCompletionTestClass staticf} {staticfoo}
    my checkCompletionContain {CodeCompletionTestClass } {staticfoo}
}
