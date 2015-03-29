IDE::DBVCUtils instproc testDComponentEdition {} {
   set rows [IDE::ComponentPersistence getVersionsForName IDECore]
   set id [lindex [lindex $rows 0] 0]
   set obj [IDE::ComponentEdition new $id]

   $obj printString 
   my assert {[$obj getName] eq "IDECore"}
   $obj setObjectsArray carr
   my assert {[info exists carr(IDE::Component)]}
   my assert {[ide::lcontain [$obj getObjectNames] IDE::Component]}
   set eobj [$obj getObject IDE::Component]
   my assert {$eobj ne ""}
   
   $eobj printString 
   $eobj initMethodsArrays 
   $eobj getInstanceMethodBody addClass
   $eobj setInstanceMethodsArray marr
   my assert {[info exists marr(addClass)]}
   
   my assert {[$eobj getName] eq "IDE::Component"}
   $eobj getClassMethodBody loadPackage
   $eobj setClassMethodsArray cmarr
   my assert {[info exists cmarr(loadPackage)]}
}
