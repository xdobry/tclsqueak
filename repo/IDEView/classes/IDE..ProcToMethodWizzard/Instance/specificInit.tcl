IDE::ProcToMethodWizzard instproc specificInit {} {
    my instvar win procedures convertInnerCalls deleteAfterConvert
    my requireNamespace
    set converInnerCalls 0
    set deleteAfterConvert 0

    frame $win.tframe
    frame $win.buttons -relief raised -border 3

    label $win.tframe.target -border 2 -width 40 -relief sunken -anchor w
    button $win.tframe.change -text "Choose Class" -command [list [self] chooseClass]
    pack $win.tframe.target $win.tframe.change -side left

    checkbutton $win.convertInnerCalls -text "replace inner calls to self invokation" -variable [self]::convertInnerCalls
    checkbutton $win.deleteAfterConverting -text "delete procs after converting" -variable [self]::deleteAfterConvert

    ::message $win.msg  -width 350 -text "Please use syntax checker to find all incompatible calls and variable references after converting. This tool do not work full automatic the converted methods must be manuelly adapted. (delete the the Tcl procedures before syntax check)" -padx 10 -pady 10

    button $win.buttons.ok -text "Convert Procedures" -command [list [self] actionConvert]
    button $win.buttons.cancel -text "Cancel" -command "destroy $win; [self] destroy" -underline 0

    pack $win.buttons.ok $win.buttons.cancel -side left

    pack $win.tframe -fill x -expand yes
    pack $win.convertInnerCalls -anchor w
    pack $win.deleteAfterConverting -anchor w
    pack $win.msg
    pack $win.buttons -anchor w -ipady 10 -ipadx 6 -fill x

    set cancelscript "
               $win.buttons.cancel configure -state active -relief sunken
               update idletasks
               after 100
               $win.buttons.cancel invoke"

    bind $win <Escape> $cancelscript
    bind $win <Alt-c> $cancelscript

    next
}
