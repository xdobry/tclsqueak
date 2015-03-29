IDEStarter proc saveCaches {} {
    set prefDir [IDEPreferences initAndgetPrepDirectory]
    if {![catch {IDE::InputCache saveCache [file join $prefDir inputCache]} err]} {
        puts $err
    }
    set repoFile [file join $prefDir ide.repo]
    set repo [SignatureRepository getSignatureRepository]
    set wrepo [$repo getWriteRepository]
    $wrepo safeRepository $repoFile
}
