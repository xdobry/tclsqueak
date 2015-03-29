IDE::System proc evalInspectString string {
    set res [my evalString $string]
    my inspectString $res
}
