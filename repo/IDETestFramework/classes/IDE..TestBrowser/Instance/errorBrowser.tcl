IDE::TestBrowser instproc errorBrowser {} {
   set errorText [my @errormessage getText]
   if {$errorText ne ""} {
     IDE::ErrorStack newBrowser $errorText
   }
}
