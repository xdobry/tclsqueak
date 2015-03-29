ChainSignatureRepository instproc addNamespaceImport {namespace importList} {
    my instvar writeRepository repositoryChain
    set realImport [list]
    foreach imp $importList {
        foreach repo $repositoryChain {
            set resolvedImports [$repo resolveImportPattern $imp]
            if {[llength $resolvedImports]>0} {
                foreach i $resolvedImports {
                    lappend realImport $i
                }
                break
            }
        }
    }
    $writeRepository addNamespaceImportBase $namespace $realImport
}
