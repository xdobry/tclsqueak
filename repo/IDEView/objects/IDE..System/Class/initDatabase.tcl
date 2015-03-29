IDE::System proc initDatabase {} {
   my instvar isDatabase
   IDEPreferences loadPreferences
   IDE::DBPersistence connect
   IDE::User initDefault
   set isDatabase 1
}
