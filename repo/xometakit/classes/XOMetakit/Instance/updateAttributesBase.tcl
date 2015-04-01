XOMetakit instproc updateAttributesBase {table idcolumn id updateset} {
    my instvar handle
    eval mk::set $handle.$table!$id $updateset
    my commit
}
