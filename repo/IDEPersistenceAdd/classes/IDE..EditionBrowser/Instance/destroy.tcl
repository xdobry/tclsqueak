IDE::EditionBrowser instproc destroy {} {
    my instvar component object mode
    if {$mode eq "component"} {
        $component destroy
    } else {
        $object destroy
    }
    next
}
