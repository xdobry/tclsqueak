ChainSignatureRepository instproc getVariableType {class stype name {namespace {}}} {
    my instvar repositoryChain
    foreach r $repositoryChain {
        set desc [$r getVariableType $class $stype $name $namespace]
        if {$desc ne ""} {
            return $desc
        }
    }
    # search in global namespace
    if {$stype eq "global" && $namespace ne "" && [string range $name 0 1] ne "::"} {
        foreach r $repositoryChain {
            set desc [$r getVariableType $class $stype $name {}]
            if {$desc ne ""} {
                return $desc
            }
        }
    }
    return
}
