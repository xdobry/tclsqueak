PrsContext instproc init {} {
    my instvar repository
    set repository [SignatureRepository getSignatureRepository]
    my initBase
    next
}
