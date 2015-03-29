SignatureRepository instproc registerObject {name creator superclasses parameters {namespace {}}} {
    my instvar xotclObjectsArr
    set sfull [list]
    tlog::info "register object name=$name creator=$creator sc=$superclasses p=$parameters namespace=$namespace"
    foreach s $superclasses {
        lappend sfull [my getFullObjectNameBase $s $namespace]
    }
    # TODO allow override?
    set fullName [my getFullObjectNameBase $name $namespace]
    set xotclObjectsArr($fullName) [list $creator $sfull $parameters]
    return $fullName
}
