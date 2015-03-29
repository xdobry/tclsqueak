SignatureRepository instproc registerObjectFullNames {name creator superclasses parameters {namespace {}}} {
    my instvar xotclObjectsArr
    tlog::info "register object name=$name creator=$creator sc=$superclasses p=$parameters namespace=$namespace"
    # TODO allow override?
    set fullName [my getFullObjectNameBase $name $namespace]
    set xotclObjectsArr($fullName) [list $creator $superclasses $parameters]
    return $fullName
}
