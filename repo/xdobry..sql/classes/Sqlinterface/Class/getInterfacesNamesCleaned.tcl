Sqlinterface proc getInterfacesNamesCleaned {} {
   # name 
   set names {}
   foreach name [my getInterfacesCleaned] {
       lappend names [lindex $name 0]
   }
   return $names
}
