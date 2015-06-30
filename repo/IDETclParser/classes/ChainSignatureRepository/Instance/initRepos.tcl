ChainSignatureRepository instproc initRepos {repositories twriteRepository} {
    my instvar repositoryChain writeRepository
    set repositoryChain $repositories
    #ttc vartype writeRepository xotcl ::SignatureRepository
    set writeRepository $twriteRepository
    my createNoUpdateCache
}
