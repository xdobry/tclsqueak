SignatureRepository proc getSignatureRepository {} {
    my instvar repository
    if {![info exists repository] || ![Object isobject $repository]} {
        set repolist [list]
        set introRepo [IntroSignatureRepository new]
        set coreRepo [CoreSignatureRepository new]
        lappend repolist $coreRepo
        lappend repolist $introRepo
        $coreRepo loadRepoForPackage XOTcl
        if {[IDE::System hasTclOO]} {
            lappend repolist [OOIntroSignatureRepository new]
            $coreRepo loadRepoForPackage TclOO
        }
        set repository [ChainSignatureRepository new]
        $repository initRepos $repolist $introRepo
    }
    return $repository
}
