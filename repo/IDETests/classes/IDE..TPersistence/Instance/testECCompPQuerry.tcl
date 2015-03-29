IDE::TPersistence instproc testECCompPQuerry {} {
    my instvar compObj compId compObjArr
    if {![$compObj isPersistent]} { 
        my stopTesting
        error {should be presistent}
    }
   if {[$compObj getName] ne "TestCase"} { error "wrong name"}
   $compObj getVersionNumber 
   $compObj getObject TestA
   $compObj printString 
   $compObj getDescriptor 
   $compObj setObjectsArray compObjArr
   $compObj questForChangeParent 
   if {[IDE::ComponentPersistence getVersionsForName TestCase] eq ""} {
        error "wrong import"
   }
   # IDE::DBPersistence Methods
   set compId [$compObj getIdValue]
   $compObj setMaxIdForMyName 
   $compObj getVersionString 
   $compObj isclosed 
   $compObj getDescriptor 
   $compObj getUserId 

   return
   $compObj addObject compObj
   $compObj updateInsert args
   $compObj rereadForAnotherVersion componentId
   $compObj updateVersion 
   $compObj versionEdition 
   $compObj updateRequired 
   $compObj registerObject compObj
   $compObj removeClass compObj
   $compObj synchronizeWithDB 
   $compObj importAllObjects 
   $compObj setRequirements reqlist
   $compObj initForPersistence 
   $compObj loadAllObjects 
   $compObj reorderObjectDefinition 
   $compObj removeObject compObj
   $compObj installObject compObj
   $compObj checkRequirementsForClass class
   $compObj addClass compObj
   $compObj loadObject compObjectid
   $compObj questForChange 
   $compObj readRequiredFromDB 
}
