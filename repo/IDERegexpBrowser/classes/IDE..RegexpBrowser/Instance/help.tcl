IDE::RegexpBrowser instproc help {} {
    global tcl_platform
    set hwin .help
    if {[winfo exist $hwin]} return
    toplevel $hwin
    wm title $hwin "Help"
    # logo
    label $hwin.l -image logo
    pack $hwin.l -side top -padx 10 -pady 10
    # help text
    if {$tcl_platform(platform) == "windows"} {
        text $hwin.t -bd 2 -relief groove -font {Courier 10}
    } else {
        text $hwin.t -bd 2 -relief groove
    }
    pack $hwin.t -side top -padx 20
    $hwin.t tag configure bold -font "[$hwin.t cget -font] bold"
    $hwin.t insert 1.0 "Version:" bold " [IDE::RegexpBrowser set version]
    Redesigned to TclSqueak Plug-In by Artur Trzewik
" normal "Usage:" bold " tkregexp <sampleFile>

" normal "Key bindings:" bold " Alt-q               exit
              Alt-a               toggle 'all' flag
              Alt-n               toggle 'nocase' flag
              Alt-l               toggle 'line' flag
              Alt-k               toggle 'lineanchor' flag
              Alt-m               toggle 'linestop' flag
              Alt-i               toggle 'inline' flag
              Alt-g               do the highlighting
              Return (in regexp)  do the highlighting

" normal "To clipboard:" bold " Put the 'regexp' command with its arguments to the clipboard

" normal "Tips:" bold " 1) To set the sample, either put a filename on the command line,
         or just copy & paste it in the sample text window.
      2) You can change the default colors or windows size by editing the
         first lines of the program file.
      3) when typing your regexp you can use Control-Z/Control-R
         to undo/redo the last typing.
      4) When using the replace function, using Control-Z restore the value
         of the sample before the replacement : you try, retry, reretry, ..."
    # ok button
    button $hwin.ok -text "Ok" -width 10 -default active -command "destroy $hwin"
    pack $hwin.ok -side bottom -pady 10
}
