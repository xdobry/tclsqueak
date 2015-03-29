SignatureRepository instproc getFullHeritage {class {namespace {}}} {
    set fullName [my getFullObjectName $class $namespace]
    if {$fullName eq ""} {
        return
    }
    my getFullHeritageReq $fullName
}
