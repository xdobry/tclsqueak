IDE::Transcript instproc specificInit args {
    my instvar win

    IDE::EditorTranscript create [self]::@editor $win.editor -editMode xotcl
    IDE::Toolbar create [self]::@toolbar $win.toolbar
    my @toolbar addCommand "Open File" [list [self]::@editor fileIn] open-task 1.0
    my @toolbar addCommand "Save File" [list [self]::@editor fileSave] save_edit 1.1
    my @toolbar addCommand "Find/Replace" [list IDE::FindReplace bindToView [self]::@editor] find 1.2
    global tcl_patchLevel
    if {[my isTranscript]} {
        wm protocol [winfo toplevel $win] WM_DELETE_WINDOW [list IDE::System exitIDEGUI]
        $win.editor.text insert 0.1 "Artur Trzewik 2001 all rights reserved\nTclSqueak (former XOTclIDE) Version [IDE::System getVersion] 12.2006\nInteractive Developing System for Tcl $tcl_patchLevel / XOTcl [set xotcl::version][set xotcl::patchlevel]\nGNU Public License Software\nTclSqueak comes with ABSOLUTELY NO WARRANTY See the GNU General Public License for more details.\n\nREADY\n\nTo run short Tcl script just write it down in editor select it and choose \"Do It\" or \"Print It\" from context menu.\nTry following. Select the line below and \"Do It\" from context menu.\n\nIDE::Dialog message \"Hello TclSqueak\""
    }
    pack $win.toolbar -side top -fill x
    pack $win.editor -side bottom -expand yes -fill both
    my initStatusBar -1

    next
}
