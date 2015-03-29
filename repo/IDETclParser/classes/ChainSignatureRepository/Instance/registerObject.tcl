ChainSignatureRepository instproc registerObject {name creator superclasses parameters {namespace {}}} {
    my instvar writeRepository
    set scfull [list]
    foreach s $superclasses {
        lappend scfull [my getFullObjectName $s $namespace]
    }
    $writeRepository registerObjectFullNames $name $creator $scfull $parameters $namespace
}
