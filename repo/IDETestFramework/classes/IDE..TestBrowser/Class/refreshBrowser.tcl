IDE::TestBrowser proc refreshBrowser {} {
   if {[llength [set browsers [IDE::TestBrowser info instances]]]>0} {
       [lindex $browsers 0] initTestCasesList
   }
}
