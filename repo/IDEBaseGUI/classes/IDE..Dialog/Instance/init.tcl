IDE::Dialog instproc init {} {
    my instvar title message type win
    set win .[Object autoname dialog]
    catch {destroy $win}
    my buildTopLevel
    wm withdraw $win
    if {$title eq "Dialog"} {
        wm title $win [::msgcat::mc "Dialog"]
    } else {
        wm title $win $title
    }
    wm protocol $win WM_DELETE_WINDOW { }
    frame $win.buttons -relief raised

    if {[info exists message]} {
        ::message $win.msg  -width 350 -text $message -padx 10 -pady 10
    }
    switch $type {
        ok {
            ttk::button $win.buttons.ok -text [::msgcat::mc "OK"] -command [list [self] actionOk] -underline 0
            pack $win.buttons.ok -padx 10 -pady 5
        }
        okcancel {
            ttk::button $win.buttons.ok -text [::msgcat::mc "OK"] -command [list [self] actionOk] -default active -underline 0
            ttk::button $win.buttons.cancel -text [::msgcat::mc "Cancel"] -command [list [self] actionCancel] -underline 0
            pack $win.buttons.ok $win.buttons.cancel -side left  -padx 10 -pady 5
            set cancelscript "$win.buttons.cancel invoke"
            bind $win <Escape> $cancelscript
            bind $win <Alt-c> $cancelscript
        }
        okcancelstop {
            ttk::button $win.buttons.ok -text [::msgcat::mc "OK"] -command [list [self] actionOk] -default active -underline 0
            ttk::button $win.buttons.cancel -text [::msgcat::mc "Cancel"] -command [list [self] actionCancel] -underline 0
            ttk::button $win.buttons.stop -text [::msgcat::mc "Stop"] -command [list [self] actionStop] -underline 0
            pack $win.buttons.ok $win.buttons.cancel $win.buttons.stop -side left  -padx 10 -pady 5
            set cancelscript "$win.buttons.cancel invoke"
            bind $win <Escape> $cancelscript
            bind $win <Alt-c> $cancelscript
        }
        none {
            # nenio butono
        }
        default {
            error "not supported dialog type $type (ok,okcancel)"
        }
    }
    if {[info exists message]} {
        pack $win.msg -side top -fill x
    }
    pack $win.buttons -side bottom -fill both

    set okscript "$win.buttons.ok invoke"
    if {$type ne "none"} {
        bind $win <Return> $okscript
        bind $win <Alt-o> $okscript
    }

    # 6. Withdraw the window, then update all the geometry information
    # so we know how big it wants to be, then center the window in the
    # display and de-iconify it.

    update idletasks
    set x [expr [winfo screenwidth $win]/2 - [winfo reqwidth $win]/2  - [winfo vrootx [winfo parent $win]]]
    set y [expr [winfo screenheight $win]/2 - [winfo reqheight $win]/2  - [winfo vrooty [winfo parent $win]]]
    wm geom $win +$x+$y

    if {[my info class]==[self class]} {
        wm deiconify $win
    }
    next
}
