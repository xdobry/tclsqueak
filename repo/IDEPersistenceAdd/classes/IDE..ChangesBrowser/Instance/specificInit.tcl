IDE::ChangesBrowser instproc specificInit {} {
    my instvar win mode vtype compare
    set vtype Instance
    set compare 0

    frame $win.buttons -relief raised -border 3
    frame $win.lframe
    frame $win.fname
    frame $win.fpar

    label $win.titleleft
    label $win.titleright
    button $win.next -text "Next Difference" -command [list [self] nextDifference]
    IDE::Text create [self]::bodyleft $win.bodyleft -width 38 -height 15
    IDE::Text create [self]::bodyright $win.bodyright -width 38 -height 15
    [[self]::bodyleft getTextWindow] configure -wrap none
    [[self]::bodyright getTextWindow] configure -wrap none
    label $win.labelleft
    label $win.labelright

    grid $win.titleleft -row 0 -column 0 -sticky w
    grid $win.titleright -row 0 -column 1 -sticky w
    set swins [my getSourcesWindows $win]
    if {[llength $swins]==1} {
        grid $swins -row 1 -column 0 -columnspan 2 -sticky news
    } elseif {[llength $swins]==2} {
        grid [lindex $swins 0] -row 1 -column 0 -sticky news
        grid [lindex $swins 1] -row 1 -column 1 -sticky news
    } else {
        frame $win.sources
        grid $win.sources -row 1 -column 0 -columnspan 2 -sticky news
        set i 0
        foreach w $swins {
            grid $w -in $win.sources -row 0 -column $i -sticky news
            grid columnconfigure $win.sources $i -weight 1
            incr i
            raise $w $win.sources
        }
        grid rowconfigure $win.sources 0 -weight 1
    }
    if {$mode eq "components" || $mode eq "objects"} {
        IDE::StateButton create [self]::cbutton $win.cbutton  -states {Instance Class} -command [list [self] changeViewType]
        grid $win.cbutton -row 3 -column 1 -sticky w
    }
    grid $win.labelleft -row 2 -column 0 -sticky w
    grid $win.labelright -row 2 -column 1 -sticky w
    grid $win.next -row 3 -column 0 -sticky w
    grid $win.bodyleft -row 4 -column 0 -sticky news
    grid $win.bodyright -row 4 -column 1 -sticky news

    grid columnconfigure $win 0 -weight 1
    grid columnconfigure $win 1 -weight 1
    grid rowconfigure $win 4 -weight 1
    IDE::TextDiffScaner create [self]::comparer -textWin1 [[self]::bodyleft getTextWindow] -textWin2 [[self]::bodyright getTextWindow]
    next
}
