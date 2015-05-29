IDE::TclModeEdit instproc modifyEvent {} {
    my instvar controler hasErrors notifyEdited noModifyEvents
    set hasErrors 0
    if {[info exists notifyEdited] && $notifyEdited && !$noModifyEvents} {
        set twin [my getTextWindow]
        if {[$twin edit modified]} {
            $controler notifyEdited [my getContentDescr]
        }
    }
}
