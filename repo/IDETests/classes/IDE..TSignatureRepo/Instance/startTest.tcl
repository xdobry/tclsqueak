IDE::TSignatureRepo instproc startTest {} {
    my instvar repo
    set repo [SignatureRepository createSignatureRepositoryFile]
    return 1
}
