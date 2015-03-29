IDE::VarsTracker instproc addWatchOn var {
    my instvar watchCount watchList win
    if {![info exists watchCount]} {
        set watchCount 0
    }
    incr watchCount
    label $win.name$watchCount -text $var -anchor w
    entry $win.var$watchCount -textvariable $var
    grid $win.name$watchCount -row $watchCount -column 0 -sticky w
    grid $win.var$watchCount -row $watchCount -column 1 -sticky we
    lappend watchList $var
}
