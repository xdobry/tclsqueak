IDE::ArrayBrowser instproc varAction args {
    my instvar introProxy vobject
    if {$vobject ne ""} {
        $vobject eval $args
    } else {
        $introProxy evalString $args
    }
}
