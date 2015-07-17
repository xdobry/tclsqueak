IDE::TCodeCompletion instproc testACodeCompletionInstvar {} {
    # ::tcodecomplation::testns nstest
    #my checkCompletion {my instvar } {ivar}
    my checkCompletion {my instvar iv} {ivar}
}
