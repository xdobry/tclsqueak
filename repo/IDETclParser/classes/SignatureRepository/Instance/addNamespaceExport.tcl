SignatureRepository instproc addNamespaceExport {namespace exportList} {
    my instvar namespaceExport
    if {$namespace eq "" || $namespace eq "::"} return
    if {![catch {set namespaceExport($namespace)} exports]} {
        foreach e $exportList {
            if {$e ni $exports} {
                lappend namespaceExport($namespace) $e
            }
        }
    } else {
        set namespaceExport($namespace) $exportList
    }
}
