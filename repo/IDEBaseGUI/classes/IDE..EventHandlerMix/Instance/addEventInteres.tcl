IDE::EventHandlerMix instproc addEventInteres {reciverObj reciverMethode eventName {addParameter {}}} {
    if {[my exists _events($eventName)]} {
        set eventList [my set _events($eventName)]
    }
    lappend eventList [list $reciverObj $reciverMethode $addParameter]
    my set _events($eventName) $eventList
}
