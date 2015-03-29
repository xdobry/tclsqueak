IDE::DocGeneratorComponent instproc localLinkToObject obj { 
   set name [string trimleft $obj :]
   if {[Object isclass $obj]} {
       return "<a href=\"#class_$obj\">$name</a>"
   } else {
       return "<a href=\"#object_$obj\">$name</a>"
   }
}
