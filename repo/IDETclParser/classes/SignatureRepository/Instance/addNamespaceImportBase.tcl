SignatureRepository instproc addNamespaceImportBase {namespace realImportList} {
    my instvar namespaceImport
    if {[catch {set namespaceImport($namespace)} importList]} {
        set namespaceImport($namespace) $realImportList
    } else {
        set namespaceImport($namespace) [lsort -unique [concat $importList $realImportList]]
    }
    return
}
