SignatureRepository proc createSignatureRepositoryFile {} {
    set introRepo [FileSignatureRepository new]
    set coreRepo [CoreSignatureRepository new]
    set repository [ChainSignatureRepository new [list $coreRepo $introRepo] $introRepo]
    return $repository
}
