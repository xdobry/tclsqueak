IDE::FindReplace proc buildWindow twin {
    my instvar win prompt
    set win $twin
    toplevel $win -class Dialog
    if {$::tcl_platform(platform) eq "windows"} {
        wm attributes .findreplace -toolwindow 1 -topmost 1
    }

    wm withdraw $win
    wm title $win [::msgcat::mc "Find/Replace Dialog"]
    wm iconname $win Dialog

    frame $win.buttons -relief sunken -borderwidth 2

    frame $win.main
    frame $win.main.options

    label $win.main.tfind -text [::msgcat::mc "Find"]
    label $win.main.tsearch -text [::msgcat::mc "Replace"]
    entry $win.main.find -textvariable [self]::findText
    entry $win.main.search -textvariable [self]::replaceText
    checkbutton $win.main.regexpr -variable [self]::regularExpresion -text [::msgcat::mc "Regular Expresion"]
    button $win.main.options.clear -text [::msgcat::mc "Clear"] -command [list [self] actionClear] -relief groove -pady 1
    button $win.main.options.setdefaults -text [::msgcat::mc "Set Defaults"] -command [list [self] actionSetDefaults] -relief groove -pady 1
    checkbutton $win.main.options.casesensitive -variable [self]::caseSensitive -text [::msgcat::mc "Case Insensitive"]
    checkbutton $win.main.options.fromcursor -variable [self]::fromCursor -text [::msgcat::mc "From Cursor"]
    checkbutton $win.main.options.backwards -variable [self]::backwards -text [::msgcat::mc "Backwards"]
    checkbutton $win.main.options.selectedtext -variable [self]::selectedText -text [::msgcat::mc "Selected Text"]
    checkbutton $win.main.options.replaceall -variable [self]::replaceAll -text [::msgcat::mc "Replace All"]
    checkbutton $win.main.options.prompt -variable [self]::prompt -text [::msgcat::mc "Prompt on Replace"]

    grid $win.main.tfind -row 0 -column 0 -sticky e
    grid $win.main.tsearch -row 2 -column 0 -sticky e
    grid $win.main.find -row 0 -column 1 -sticky ew
    grid $win.main.search -row 2 -column 1 -sticky ew
    grid $win.main.regexpr -row 1 -column 1 -sticky w

    grid $win.main.options.clear -row 0 -column 0 -pady 2
    grid $win.main.options.setdefaults -row 0 -column 1 -sticky w -pady 2
    grid $win.main.options.casesensitive -row 1 -column 0  -sticky w
    grid $win.main.options.backwards -row 3 -column 0 -sticky w
    grid $win.main.options.fromcursor -row 2 -column 0 -sticky w
    grid $win.main.options.selectedtext -row 1 -column 1 -sticky w
    grid $win.main.options.prompt -row 3 -column 1 -sticky w
    grid $win.main.options.replaceall -row 2 -column 1 -sticky w

    grid $win.main.options -row 3 -column 0 -columnspan 2 -sticky news -pady 4 -ipadx 0
    grid columnconfigure $win.main 1 -weight 1


    button $win.buttons.find -text [::msgcat::mc "Find"] -command [list [self] actionFind] -default active -underline 0
    button $win.buttons.replace -text [::msgcat::mc "Replace"] -command [list [self] actionReplace] -underline 0
    button $win.buttons.close -text [::msgcat::mc "Close"] -command [list [self] actionClose] -underline 0
    pack $win.buttons.find $win.buttons.replace $win.buttons.close -side left  -padx 10 -pady 5

    pack $win.main -side top -fill both -expand yes -padx 10 -pady 5
    pack $win.buttons -side bottom -fill both

    set cancelscript "
    $win.buttons.close configure -state active
    update idletasks
    after 100
    $win.buttons.close configure -state normal
    [self] actionClose"
    bind $win <Escape> $cancelscript
    bind $win <Alt-c> $cancelscript
    set findscript "
    $win.buttons.find configure -state active
    update idletasks
    after 100
    $win.buttons.find configure -state normal
    [self] actionFind"
    bind $win <Return> $findscript
    bind $win <Alt-f> $findscript
    set replacescript "
    $win.buttons.replace configure -state active
    update idletasks
    after 100
    $win.buttons.replace configure -state normal
    [self] actionReplace"
    bind $win <Alt-r> $replacescript
}
