PrsFileContext instproc init {} {
    my instvar repository logStream errorCount fileName
    set logStream stdout
    #ttc vartype logStream channelid
    set fileName ""
    set repository [SignatureRepository createSignatureRepositoryFile]
    set errorCount 0
    my initBase
}
