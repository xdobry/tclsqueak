IDE::PersistenceCopy instproc importForId id {
     set desc [my getDescriptor]
     my set [$desc idColumn] $id
     my rereadAttributes [$desc getColumns]
}
