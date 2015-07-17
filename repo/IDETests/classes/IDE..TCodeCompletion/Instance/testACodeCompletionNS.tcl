IDE::TCodeCompletion instproc testACodeCompletionNS {} {
    # ::tcodecomplation::testns nstest
    my checkCompletion {::tcodecompla} {::tcodecomplation}
    my checkCompletion {::tcodecomplation::tes} {::tcodecomplation::testns}
    my checkCompletion {::tcodecomplation::} {::tcodecomplation::testns}
    my checkCompletion {::tcodecomplation} {::tcodecomplation::testns}
    my checkCompletion {::tcodecomplation::testns} {::tcodecomplation::testns::nstest}
    my checkCompletion {::tcodecomplation::testns::nst} {::tcodecomplation::testns::nstest}
    my checkCompletionContain {::} {::tcodecomplation}
}
