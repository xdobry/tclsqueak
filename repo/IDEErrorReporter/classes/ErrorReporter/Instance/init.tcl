ErrorReporter instproc init text {
    my instvar win errorMsg
    set errorMsg $text
    set win [Object autoname .errorReporter]
    ::toplevel $win
    wm withdraw $win
    wm protocol [winfo toplevel $win] WM_DELETE_WINDOW [list [self] destroy]
    wm title $win "Error Reporter"
    ::message $win.msg -text {An Tcl Error has occured in the System. Please enter the comment. Generate a error-report file and send it to
   mail@xdobry.de.
Lets the bugs die} -width 250
    ttk::label $win.lcomment -text Comments:
    text $win.comment -width 60 -height 12
    frame $win.tf
    ttk::label $win.tf.text -text {Your Name}
    my requireNamespace
    ttk::entry $win.tf.user -textvariable [self]::userName
    pack $win.tf.text $win.tf.user -side left
    pack $win.msg
    pack $win.tf $win.lcomment -anchor w
    pack $win.comment -expand yes -fill both -padx 10 -pady 10

    frame $win.bf -borderwidth 3 -relief raised
    ttk::button $win.bf.ok -text {Generate Report Filie} -command [list [self] generateReport]
    ttk::button $win.bf.cancel -text Cancel -command [list [self] destroy]
    pack $win.bf.ok $win.bf.cancel -side left
    if {[Object isobject IDE::ErrorStack]} {
        button $win.bf.eb -text {Error Browser} -command [list IDE::ErrorStack newBrowser $errorMsg]
        pack $win.bf.eb -side left -padx 20
    }

    pack $win.bf -anchor w -fill x -expand yes
    wm deiconify $win
}
