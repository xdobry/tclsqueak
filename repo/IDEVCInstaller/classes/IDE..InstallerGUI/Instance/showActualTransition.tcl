IDE::InstallerGUI instproc showActualTransition args {
   [self] instvar step runTransitions
   set tr [lindex $runTransitions $step]
   [self] cleanInputGUI
   [self]::info setText [lindex $tr 3]
   [self] [lindex $tr 0]
   
}
