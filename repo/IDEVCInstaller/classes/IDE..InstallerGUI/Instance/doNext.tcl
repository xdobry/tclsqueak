IDE::InstallerGUI instproc doNext {} {
   [self] instvar step runTransitions 
   set tr [lindex $runTransitions $step]
   if {[[self] [lindex $tr 1]]} {
        [self] [lindex $tr 2]
        incr step
        if {[llength $runTransitions]<=$step} {
           [self] doFinish
        } else {
           [self] showActualTransition
        }
   }
}
