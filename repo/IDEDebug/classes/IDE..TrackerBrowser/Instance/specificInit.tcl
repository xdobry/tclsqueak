IDE::TrackerBrowser instproc specificInit {} {
    my instvar win

    panedwindow $win.panedwindow -orient vertical
    frame $win.upwin
    frame $win.f

    checkbutton $win.f.protentry -text {Prot Method Entry} -variable IDE::MethodTracker::methodEntry
    checkbutton $win.f.protexit -text {Prot Method Exit} -variable IDE::MethodTracker::methodExit
    checkbutton $win.f.ignoreargs -text {Ignore Arguments} -variable IDE::MethodTracker::ignoreArguments
    checkbutton $win.f.ignoreinternal -text {Ignore Internal Calls} -variable IDE::MethodTracker::ignoreInternalCalls
    checkbutton $win.f.ignorecalling -text {Ignore Calling Info} -variable IDE::MethodTracker::ignoreCallingInfo
    checkbutton $win.f.protToStoud -text {Protokol to stdout} -variable IDE::MethodTracker::stoutProtokoll

    grid $win.f.protentry -column 0 -row 0 -sticky w
    grid $win.f.protexit -column 0 -row 1 -sticky w
    grid $win.f.ignoreargs -column 1 -row 0 -sticky w
    grid $win.f.ignoreinternal -column 1 -row 1 -sticky w
    grid $win.f.ignorecalling -column 2 -row 0 -sticky w
    grid $win.f.protToStoud -column 2 -row 1 -sticky w

    IDE::TrackedMethodList create [self]::objectlist $win.objects -height 1
    IDE::ProtocolText create [self]::protokol $win.protokol -width 38 -height 2

    pack $win.objects -fill both -expand yes -in $win.upwin
    pack $win.f -anchor w -in $win.upwin
    pack $win.protokol -fill both -expand yes

    $win.panedwindow add $win.upwin -sticky news -height 130
    $win.panedwindow add $win.protokol -sticky news -height 130

    pack $win.panedwindow -expand yes -fill both

    [self]::objectlist updateList
    next
}
