IDE::MethodDB instproc loadFromDB {} {
    my instvar vclass
    set introProxy [my getIntroProxy]
    set cdesc [$introProxy getDescriptionForObject $vclass]
    IDE::VersionBrowser  [Object autoname vbrowser] [Object autoname .vbrowser] -vobject $cdesc -type available -componentObject [$introProxy getCompObjectFor $vclass]
}
