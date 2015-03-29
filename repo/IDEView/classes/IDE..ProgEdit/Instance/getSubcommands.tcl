IDE::ProgEdit instproc getSubcommands command {
    set repo [SignatureRepository getSignatureRepository]
    set descs [$repo getCommandDescription $command]
    if {[llength $descs]>0} {
        return [ttype::subcommands $descs]
    }
    return
}
