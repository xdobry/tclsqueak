IDE::ConfigMapTestNoGUI instproc testBHComponentWrapperTest {} {
   my instvar cwrap
   $cwrap getRequirements 
   $cwrap versionDisplay 
   #$cwrap load 
   my assert {[$cwrap isActualLoaded]}
   #$cwrap viewEdition 
   #$cwrap viewInfo 
   $cwrap nameVersion
    
}
