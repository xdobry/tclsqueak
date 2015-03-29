IDE::MethodDB instproc loadEdition actual {
    my instvar vclass
    set introProxy [my getIntroProxy]
    set cdesc [$introProxy getDescriptionForObject $vclass]
    IDE::VersionBrowser [Object autoname vbrowser] [Object autoname .vbrowser] -vobject $cdesc -type version -name $actual -componentObject [$introProxy getCompObjectFor $vclass]
}
