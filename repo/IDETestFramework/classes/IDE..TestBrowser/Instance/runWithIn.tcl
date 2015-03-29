IDE::TestBrowser instproc runWithIn method {
   my instvar testRunner win
   $win.runall configure -state disabled
   $win.runselected configure -state disabled
   my $method
   $win.runall configure -state normal
   $win.runselected configure -state normal
}
