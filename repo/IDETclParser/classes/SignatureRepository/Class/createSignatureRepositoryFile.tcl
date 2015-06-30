SignatureRepository proc createSignatureRepositoryFile {} {
    set repository [ChainSignatureRepository new]
    set introRepo [FileSignatureRepository new -childof $repository]
    set coreRepo [CoreSignatureRepository new -childof $repository]
    $repository initRepos [list $coreRepo $introRepo] $introRepo
    return $repository
}
