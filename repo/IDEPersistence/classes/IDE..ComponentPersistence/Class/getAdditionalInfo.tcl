IDE::ComponentPersistence proc getAdditionalInfo componentId {
    set retList [[IDE::DBPersistence getPersistenceManager] getAditionalInfoForComponentId $componentId]
    join $retList \n
}
