IDE::MetakitPersistenceManager instproc updateAttributesBase {table idcolumn id updateset} {
    [my connection] updateAttributesBase $table $idcolumn $id $updateset
}
