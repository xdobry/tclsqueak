IDE::TCodeCompletion instproc testACodeCompletionClassCalls {} {
    my checkCompletion {CodeCompletionTestCla} {CodeCompletionTestClass}
    my checkCompletion {CodeCompletionTestClass ne} {new}
    my checkCompletion {CodeCompletionTestClass staticf} {staticfoo}
    my checkCompletionContain {CodeCompletionTestClass } {staticfoo}
    my checkCompletion {Object isobj} {isobject}
    my checkCompletionContain {Object } {isobject}
    my checkCompletion {xotcl::Object isobj} {isobject}
}
