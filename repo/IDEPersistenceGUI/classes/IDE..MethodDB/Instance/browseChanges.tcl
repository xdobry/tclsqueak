IDE::MethodDB instproc browseChanges actual {
    my instvar vclass vtype
    set introProxy [my getIntroProxy]
    set cdesc [$introProxy getDescriptionForObject $vclass]
    if {$cdesc eq ""} return
    set method [$cdesc get${vtype}Method $actual]
    set method2id [IDE::VersionChooser getVersion $cdesc $actual]
    if {$method2id eq ""} return
    if {$method2id==[$method set methodid]} {
        IDE::Dialog message "Choosen Edition $method2id of $actual is the same with actual loaded"
        return
    }
    IDE::ChangesBrowser compareMethods [$method getBody] [$cdesc getAdditionalInfo $method2id]
}
