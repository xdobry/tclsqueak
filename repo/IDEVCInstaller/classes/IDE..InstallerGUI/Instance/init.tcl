IDE::InstallerGUI instproc init win {
   if {$win eq "."} {
     frame .i
     pack .i -fill both -expand yes
     set win .i
   }
   next $win
   [self] requireNamespace
   [self] set step 0
   [self] initRun
   IDEPreferences loadPreferences
   [self] showActualTransition
}
