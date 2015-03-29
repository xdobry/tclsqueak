IDE::DBRelMappingNM instproc addIndexForSourceId {pkValue index orderValue} {
    [IDE::DBPersistence getConnection] insertRow [my relationTable] [list [my sourceName] [my targetName] [my orderIndexName]] [list $pkValue $index $orderValue] {int int int}
}
