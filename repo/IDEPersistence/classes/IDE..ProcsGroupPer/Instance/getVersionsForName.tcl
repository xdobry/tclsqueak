IDE::ProcsGroupPer instproc getVersionsForName name {
   [IDE::DBPersistence getPersistenceManager] getVersionsForName $name {methodid timest versioninfo username} IDE::MethodDescription::descriptor
}
