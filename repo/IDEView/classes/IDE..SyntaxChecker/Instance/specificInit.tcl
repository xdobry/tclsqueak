IDE::SyntaxChecker instproc specificInit {} {
    my instvar win

    panedwindow $win.panedwindow -orient vertical
    set topwin [panedwindow $win.upperarea -orient horizontal]

    set mainframe [frame $win.mframe]
    set bframe [frame $mainframe.bframe]

    IDE::ListView create [self]::components $topwin.components -multiselect 1 -label "Components Alt-1"
    IDE::SyntaxCheckMethodList create [self]::methods $topwin.methods -notify [self] -notifyProc selectMethod -width 45 -label "Methods Alt-2"
    IDE::NListView create [self]::messages $topwin.messages -notify [self] -notifyProc selectError -width 40 -label "Errors Alt-3 (Alt-n/p next/prev)"

    ttk::button $bframe.check -text "Check Selected" -underline 0 -command [list [self] checkComponents]
    ttk::button $bframe.all -text "Select All Components" -underline 7 -command [list [self] selectAll]
    ttk::button $bframe.allTcl -text "Exclude IDE Components" -underline 1 -command [list [self] excludeIDE]

    IDE::TclModeEdit [self]::methodedit $mainframe.body -mixin IDE::CodeController

    pack $bframe.check $bframe.all $bframe.allTcl -side left -anchor nw
    pack $bframe -side top -anchor nw -fill x
    pack $mainframe.body -fill both -side bottom -expand 1

    $topwin add $topwin.components $topwin.methods $topwin.messages -width 200
    $win.panedwindow add $topwin -sticky news -height  160
    $win.panedwindow add $mainframe -sticky news -height 260
    pack $win.panedwindow -expand yes -fill both

    bind $win <Alt-a> [list [self] selectAll]
    bind $win <Alt-c> [list [self] checkComponents]
    bind $win <Alt-x> [list [self] excludeIDE]
    bind $win <Alt-p> [list [self]::messages selectPrevItem]
    bind $win <Alt-n> [list [self]::messages selectNextItem]

    bind $win <Alt-KeyPress-1> [list focus [[self]::components getFocusWin]]
    bind $win <Alt-KeyPress-2> [list focus [[self]::methods getFocusWin]]
    bind $win <Alt-KeyPress-3> [list focus [[self]::messages getFocusWin]]

    my readComponents

    focus [[self]::components getFocusWin]

    next
    
    IDE::CBCodeController create [self]::@codecontroller

    my initStatusBar -1
    my setStatusBarText "This tool check the syntax in selected components"
}
