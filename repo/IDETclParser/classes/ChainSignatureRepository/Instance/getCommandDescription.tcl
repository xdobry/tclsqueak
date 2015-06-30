ChainSignatureRepository instproc getCommandDescription {name {namespace {}}} {
    my instvar repositoryChain
    set oname [my getOriginName $name $namespace]
    if {$oname ne ""} {
        set name $oname
    }
    foreach r $repositoryChain {
        set desc [$r getCommandDescription $name $namespace]
        if {$desc ne ""} {
            return $desc
        }
        if {$namespace ne "" && [string range $name 0 1] ne "::" } {
            set desc [$r getCommandDescription $name {}]
            if {$desc ne ""} {
                return $desc
            }
        }
    }
    # search in global namespace
    return
}
