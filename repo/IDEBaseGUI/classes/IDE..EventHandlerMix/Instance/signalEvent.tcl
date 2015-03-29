IDE::EventHandlerMix instproc signalEvent {eventName {addParameter {}}} {
    if {[my exists _events($eventName)]} {
        foreach elist [my set _events($eventName)] {
            foreach {obj methode params} $elist {
                if {[Object isobject $obj]} {
                    if {$params eq "" && $addParameter eq ""} {
                        $obj $methode
                    } elseif {$addParameter ne "" && $params eq ""} {
                        $obj $methode $addParameter
                    } elseif {$params ne "" && $addParameter eq ""} {
                        $obj $methode $params
                    } else {
                        $obj $methode $params $addParameter
                    }
                }
                # try to implement garbage removing from events
            }
        }
    }
}
