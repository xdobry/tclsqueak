IDE::ObjectDescription proc getAdditionalInfo objectid {
    [IDE::DBPersistence getPersistenceManager] getAditionalInfoForObjectId $objectid
}
