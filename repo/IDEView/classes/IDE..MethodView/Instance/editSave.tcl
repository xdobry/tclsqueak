IDE::MethodView instproc editSave skript {
   my instvar vtype vclass actItem history historyIndex vcategories
   if {![info complete $skript]} {
       IDE::Dialog message {This is not complete Tcl-Script. Check the parentheses}
       return
   }
   if {$vtype eq "Procs" && [lindex $skript 0] eq "proc"} {
       set procname [$vclass handleScript $skript]
   } else {
       set introProxy [my getIntroProxy]
       regsub -all -line { +$} $skript {} skript
       $introProxy handleScript $skript
   }
   if {[info exists actItem] && $actItem ne ""} {
       lassign $actItem oclass otype omethod
   } else {
       set oclass $vclass
       set omethod {}
       set otype $vtype
   }
   lassign [my getItemFromSkript $skript] nclass ntype nmethod
   if {$nclass eq "proc"} {
       if {$nmethod eq $omethod} {
           return
       } else {
           if {$otype eq "Procs" && $procname ne ""} {
               set hitem [list $oclass $otype $procname]
               my addItem $procname
               my setSelectedItem $procname 0
           } else {
               return
           }
       }
   } else {
       if {$nmethod eq $omethod && $ntype eq $otype && $nclass eq $oclass} {
           return
       } else {
           set actItem [list $nclass $ntype $nmethod]
           if {[IDE::XOIntroProxy getAbstractMethodType $ntype] eq $vtype && $nclass eq $vclass && ($vcategories eq "_all_categories" || $vcategories eq "_uncategorized")} {
               my addItem $nmethod
               my setSelectedItem $nmethod 0
           }
       }
   }
    incr historyIndex
    set history [linsert $history $historyIndex $actItem]
}
