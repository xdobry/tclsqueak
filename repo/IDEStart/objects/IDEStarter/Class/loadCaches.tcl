IDEStarter proc loadCaches {} {
    set prefDir [IDEPreferences initAndgetPrepDirectory]
    if {![catch {IDE::InputCache loadCache [file join $prefDir inputCache]} err]} {
        puts $err
    }
    set repoFile [file join $prefDir ide.repo]
    if {[file readable $repoFile]} {
        set repo [SignatureRepository getSignatureRepository]
        set wrepo [$repo getWriteRepository]
        $wrepo loadRepository $repoFile
    }
}
