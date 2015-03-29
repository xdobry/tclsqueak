IDE::Editor instproc substituteString string {
    my instvar introProxy
    if {[info exists introProxy] && [Object isobject $introProxy]} {
        $introProxy substituteString $string
    } else {
        IDE::System substituteString $string
    }
}
