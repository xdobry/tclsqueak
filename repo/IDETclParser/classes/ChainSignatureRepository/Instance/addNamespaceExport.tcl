ChainSignatureRepository instproc addNamespaceExport {namespace exportList} {
    my instvar writeRepository
    $writeRepository addNamespaceExport $namespace $exportList
}
