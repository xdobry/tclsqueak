IDE::System proc initDatabaseNoConnect {} {
   my instvar isDatabase
   IDE::DBPersistence initSchema
   IDE::User initDefault
   set isDatabase 1
}
