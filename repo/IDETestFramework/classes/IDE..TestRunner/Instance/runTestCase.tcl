IDE::TestRunner instproc runTestCase {testCase notifier} {
    my instvar shouldBreak
    set shouldBreak 0
    
    set results [list]
    set test [$testCase new -childof [self]]
    
    if {![$test startTest]} {
       IDE::Dialog error "Can not initialize $testCase test. No Test are started"
       return $results
   }
   set startTime [clock milliseconds]
   foreach m [my getTestsForCase $testCase] {
       update
       if {$shouldBreak || [$test shouldStop]} break
       set r [dict create class $testCase method $m]
       if {[catch {$test $m}]} {
           dict set r status error
           dict set r error $::errorInfo
       } else {
           dict set r status ok
       }
       set stopTime [clock milliseconds]
       dict set r time [expr {$stopTime-$startTime}]
       set startTime $stopTime
       lappend results $r
       if {$notifier ne ""} {
           $notifier notifyTestEnd $r
       }
   }
   $notifier notifyClassEnd $testCase
   
   catch {$test endTest}
   $test destroy
   return results
}
