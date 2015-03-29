IDE::MethodTracker proc methodEntry {calledclass object calledproc callingclass callingobject callingproc mArgs} {
    my instvar ignoreInternalCalls ignoreArguments methodEntry ignoreCallingInfo trackedArr callingCover methodCoverArr stoutProtokoll
    if {!$methodEntry} return
    if {![info exists trackedArr($calledclass)] && ![info exists trackedArr($object)]} return
    if {$callingCover} {
        if {$calledclass ne ""} {
            ide::addToValueForKeyIfNone methodCoverArr $calledclass $calledproc
        } else {
            ide::addToValueForKeyIfNone methodCoverArr $object $calledproc
        }
    }
    if {$ignoreInternalCalls && $object==$callingobject} return
    set ret "> $calledclass . $object > $calledproc"
    if {!$ignoreCallingInfo} {
        append ret " from $calledclass . $callingobject > $callingproc"
    }
    if {!$ignoreArguments} {
        append ret " : [list $mArgs]"
    }
    if {$stoutProtokoll} {
        puts " tracker: $ret"
    }
    IDE::TrackerBrowser addToProtocol $ret
}
