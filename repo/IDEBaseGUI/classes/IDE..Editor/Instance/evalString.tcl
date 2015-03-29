IDE::Editor instproc evalString string {
    my instvar introProxy
    if {[info exists introProxy] && [Object isobject $introProxy]} {
        $introProxy evalString $string
    } else {
        IDE::System evalString $string
    }
}
