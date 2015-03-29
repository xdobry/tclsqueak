IDE::TclModeEdit instproc canSetBreakpoint {} {
   my instvar vtype editMode breakpoint
   return [expr {$editMode eq "xotcl" && $vtype eq "Source" && [info exists breakpoint] && $breakpoint eq ""}]
}
