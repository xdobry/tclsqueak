IDE::DBVCUtils instproc endTest {} {
   my instvar compBrowser
   if {[Object isobject $compBrowser]} {
       $compBrowser destroy
   }
}
