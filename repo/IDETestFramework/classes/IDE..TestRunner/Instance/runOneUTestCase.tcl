IDE::TestRunner instproc runOneUTestCase {testCase method notifier} {
    my instvar shouldBreak
    set shouldBreak 0

    set startTime [clock milliseconds]
    set result [dict create class $testCase method $method]
    set test [$testCase new -childof [self]]
    
    if {![$test startTest]} {
        dict set result status error
        dict set result error "method startTest returns false"
        return $result
    } else {
        if {[catch {$test $method}]} {
            dict set result status error
            dict set result error $::errorInfo
        } else {
            dict set result status ok
        }
    }
    set stopTime [clock milliseconds]
    dict set result time [expr {$stopTime-$startTime}]
    if {$notifier ne ""} {
        $notifier notifyTestEnd $result
    }
   
   catch {$test endTest}
   $test destroy
   return result
}
