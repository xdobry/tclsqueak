IDE::TPersistence instproc testBBComponentQuery {} {
   # Querring the VC-DB. Ask von components and available version    
   set anames [IDE::ComponentPersistence getAvailable]
   set cname [lindex $anames [expr round(rand() * ([llength $anames]-1))]]
   set versions [IDE::ComponentPersistence getVersionsForName $cname]
   set version [lindex $versions [expr round(rand() * ([llength $versions]-1))]]
   set versionId [lindex $version 0]
   IDE::ComponentPersistence getAdditionalInfo $versionId
   IDE::ComponentPersistence readRequiredForId $versionId
}
