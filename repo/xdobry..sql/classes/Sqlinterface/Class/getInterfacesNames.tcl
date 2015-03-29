Sqlinterface proc getInterfacesNames {} {
   # name 
   set names {}
   foreach name [my getInterfaces] {
       lappend names [lindex $name 0]
   }
   return $names
}
