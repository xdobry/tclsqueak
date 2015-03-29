IDE::System proc isDatabase {} {
   my instvar isDatabase
   if {[info exists isDatabase]} {
      return 1
   } else {
      return 0
   }
}
