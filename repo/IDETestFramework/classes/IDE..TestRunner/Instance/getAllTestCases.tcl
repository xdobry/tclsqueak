IDE::TestRunner instproc getAllTestCases {} {
    set ret [list]
    foreach testClass [concat [IDE::TestCase info subclass] [IDE::UTestCase info subclass]] {
        if {$testClass eq "::IDE:UTestCase"} continue
        lappend ret [list $testClass [my getTestsForCase $testClass]]
    }
    return $ret
}
