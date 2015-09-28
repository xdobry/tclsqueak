IDE::Transcript instproc specificInit args {
    my instvar win

    set toolbar [IDE::Toolbar create [self]::@toolbar $win.toolbar]

    IDE::EditorTranscript create [self]::@editor $win.editor -editMode xotcl -toolbar $toolbar
    
    global tcl_patchLevel
    if {[my isTranscript]} {
        wm protocol [winfo toplevel $win] WM_DELETE_WINDOW [list IDE::System exitIDEGUI]
        $win.editor.text insert 0.1 "Artur Trzewik 2001 all rights reserved\nTclSqueak (former XOTclIDE) Version [IDE::System getVersion] 09.2015\nInteractive Developing System for Tcl $tcl_patchLevel / XOTcl [set xotcl::version][set xotcl::patchlevel]\nGNU Public License Software\nTclSqueak comes with ABSOLUTELY NO WARRANTY See the GNU General Public License for more details.\n\nREADY\n\nTo run short Tcl script just write it down in editor select it and choose \"Do It\" or \"Print It\" from context menu.\nTry following. Select the line below and \"Do It\" from context menu.\n\nIDE::Dialog message \"Hello TclSqueak\""
    }
    pack $win.toolbar -side top -fill x
    pack $win.editor -side bottom -expand yes -fill both
    my initStatusBar -1

    next
}
