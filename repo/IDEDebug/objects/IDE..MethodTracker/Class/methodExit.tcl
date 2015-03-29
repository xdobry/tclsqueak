IDE::MethodTracker proc methodExit {calledclass object calledproc callingclass callingobject callingproc returnValue} {
    my instvar ignoreInternalCalls ignoreArguments methodExit ignoreCallingInfo trackedArr stoutProtokoll
    if {$methodExit} {
        if {$ignoreInternalCalls && $object==$callingobject} return
        set cclass [string trimleft $calledclass :]
        if {[info exists trackedArr($calledclass)] ||
              [info exists trackedArr($object)]} {
            set ret "< $calledclass . $object > $calledproc"
            if {!$ignoreCallingInfo} {
               append ret " from $calledclass . $callingobject > $callingproc"
            }
            if {!$ignoreArguments && $returnValue ne ""} {
               append ret " return $returnValue"
            }
            if {$stoutProtokoll} {
                puts " exit tracker: $ret"
            }
            IDE::TrackerBrowser addToProtocol $ret
        }
    }
    return $returnValue
}
