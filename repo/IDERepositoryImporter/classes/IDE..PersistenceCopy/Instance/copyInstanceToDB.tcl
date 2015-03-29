IDE::PersistenceCopy instproc copyInstanceToDB {} {
   if {[my exists userid]} {
       my set userid [my getUserId]
   }
   if {[my exists basedon]} {
       my set basedon {}
   }
   if {[my exists infoid] && [my set infoid] ne ""} {
       my importComment
   }
   set des [my getDescriptor]
   set columns [$des getColumns]
   set values [my getInsertValues columns]
   set keyvalue [[my getTargetConnection] insertRowAutoId [$des table] $columns $values [$des idColumn]]
   my set newid $keyvalue
}
