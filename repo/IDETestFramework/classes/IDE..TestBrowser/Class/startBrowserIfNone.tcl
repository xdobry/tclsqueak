IDE::TestBrowser proc startBrowserIfNone {} {
    if {[llength [set browsers [IDE::TestBrowser info instances]]]==0} {
       my newBrowser
   }
}
