IDE::ConfigMapTestNoGUI instproc testCHTestConfmap {} {
   my instvar confmap
   #$confmap setCMaps cmaps
   #$confmap updateVersion 
   $confmap versionDisplay 
   my assert {[$confmap getCMaps] eq ""}
   #$confmap viewInfo
   $confmap getCMapString 
   #$confmap copyAndCreateNewEdition 
   #$confmap load 
   $confmap reorderComponents 
   #$confmap setComponents comps
   $confmap setComponetsArray testArr
   #$confmap exportToMap file
   #$confmap importFromMap 
   #$confmap makeTransient 
   $confmap getCMapsNamesDeep 
   $confmap getComponents 
   $confmap nameVersion
}
