IDE::TestRunner instproc runUTestCase {testCase notifier} {
    my instvar shouldBreak
    set shouldBreak 0

    set results [list]
    foreach m [my getTestsForCase $testCase] {
        update
        if {$shouldBreak} break
        lappend results [my runOneUTestCase $testCase $m $notifier]
    }
    $notifier notifyClassEnd $testCase
    return $results
}
