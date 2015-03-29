IDE::TestBrowser instproc runSelectedTests {} {
   my instvar testRunner win idArr
   lassign [my getSelectedClassMethod] class method
   if {$class eq ""} return
   if {$method ne ""} {
       if {"::IDE::UTestCase" in [$class info heritage]} {
           $testRunner runOneUTestCase $class $method [self]
       } else {
           IDE::Dialog error "need to be subclass of IDE::UTestCase to run only one method"
       }
   } else {
       $testRunner runTestCase $class [self]
  }
}
