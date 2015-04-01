SqlDebugger proc applyProtokoll text {
   my instvar protBrowser
   if {[Object isobject $protBrowser]} {
       $protBrowser append $text
   }
}
