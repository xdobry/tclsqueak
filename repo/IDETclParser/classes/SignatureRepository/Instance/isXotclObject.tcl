SignatureRepository instproc isXotclObject {name {namespace {}}} {
    set fullName [my getFullObjectName $name $namespace]
    expr {$fullName ne ""}
}
