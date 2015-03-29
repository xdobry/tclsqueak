ChainSignatureRepository instproc updateSignatureTypes {desc types} {
    my instvar writeRepository noUpdateCache
    if {[lsearch -sorted $noUpdateCache [lindex $desc 0]]<0} {
        $writeRepository updateSignatureTypes $desc $types
    }
}
