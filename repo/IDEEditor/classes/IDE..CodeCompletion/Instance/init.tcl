IDE::CodeCompletion instproc init {} {
    my instvar repo
    set repo [SignatureRepository getSignatureRepository]
}
