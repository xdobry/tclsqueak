IDE::TestBrowser instproc runAllTests {} {
   my instvar testRunner win
   set testClasses [list]
   foreach item [$win.tree children {}] {
       lappend testClasses [$win.tree item $item -text]
   }
   $testRunner runTestCases $testClasses [self]
}
