IDE::ObjectBrowser proc newBrowser {object {introProxy {}}} {
    if {$introProxy eq ""} {
        set introProxy [IDE::XOIntroProxy getIntroProxyForObject $object]
    }
    if {$introProxy eq ""} {
        return
    }
    set newinst [my new [Object autoname .objectbrowser]]
    $newinst setViewObject $object $introProxy
    if {[Object isobject $object]} {
        IDE::DestroyMixForward registerDestroyForwardObj $object $newinst
    }
    return $newinst
}
