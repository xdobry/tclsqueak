IDE::CodeCompletion instproc getSubcommands command {
    my instvar repo
    set descs [$repo getCommandDescription $command]
    if {[llength $descs]>0} {
        return [ttype::subcommands $descs]
    }
    return
}
