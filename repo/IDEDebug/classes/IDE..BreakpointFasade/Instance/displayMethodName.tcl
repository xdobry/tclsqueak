IDE::BreakpointFasade instproc displayMethodName {} {
   my instvar vctype oomethod vclass
   if {$vctype eq "Tcl Procs" || $vctype eq "Procs"} {
       return $oomethod
   } elseif {$vctype eq "Class"} {
       return "$vclass Class>$oomethod"
   } else {
       return "$vclass>$oomethod"
   }
}
