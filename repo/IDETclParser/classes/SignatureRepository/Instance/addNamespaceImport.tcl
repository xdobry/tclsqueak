SignatureRepository instproc addNamespaceImport {namespace importList} {
    my instvar namespaceImport
    set realImport [list]
    foreach imp $importList {
        foreach i [my resolveImportPattern $imp] {
            lappend realImport $i
        }
    }
    if {[catch {set namespaceImport($namespace)} importList]} {
        set namespaceImport($namespace) $realImport
    } else {
        set namespaceImport($namespace) [lsort -unique [concat $importList $realImport]]
    }
    return
}
