IDE::TPersistence instproc testBCClassQuery {} {
   # Querring the VC-DB. Ask von classes and available version
   set anames [IDE::ObjectDescription getAvailable]
   set cname [lindex $anames [expr round(rand() * ([llength $anames]-1))]]
   set versions [IDE::ObjectDescription getVersionsForName $cname]
   set version [lindex $versions [expr round(rand() * ([llength $versions]-1))]]
   set versionId [lindex $version 0]
   IDE::ObjectDescription getAdditionalInfo $versionId
}
