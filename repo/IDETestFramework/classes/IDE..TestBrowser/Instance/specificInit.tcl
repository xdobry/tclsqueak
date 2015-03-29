IDE::TestBrowser instproc specificInit {} {
    [self] instvar win testCases testRunner

    set testCases {}
    set testRunner [IDE::TestRunner new -childof [self]]

    frame $win.toolbar

    panedwindow $win.panedwindow -orient horizontal

    frame $win.tframe
    ttk::treeview $win.tree -columns {status time} -yscrollcommand [list $win.vsb set]
    ttk::scrollbar $win.vsb -orient vertical -command [list $win.tree yview]
    $win.tree heading \#0 -text "Tests"
    $win.tree heading status -text "Status"
    $win.tree heading time -text "Time"
    $win.tree column status -stretch 0 -width 45
    $win.tree column time -stretch 0 -width 45
    bind $win.tree <<TreeviewSelect>> [list [self] selectTest]
    bind $win.tree <Double-Button-1> [list [self] showSource]
    $win.tree tag configure ok -background green
    $win.tree tag configure error -background red

    pack $win.vsb -side right -fill y -in $win.tframe
    pack $win.tree -expand yes -fill both -in $win.tframe

    IDE::Text [self]::@errormessage $win.errormessage -width 30 -height 15
    button $win.runall -text {Run All} -command [list [self] runWithIn runAllTests]
    button $win.runselected -text {Run Selected} -command [list [self] runWithIn runSelectedTests]
    button $win.errorbrowser -text {ErrorStack Browser} -command [list [self] errorBrowser]
    button $win.refresh -text {Refresh Tests} -command [list [self] refreshTests]

    pack $win.runall $win.runselected $win.errorbrowser $win.refresh -side left -in $win.toolbar

    pack $win.toolbar -side top -fill x

    $win.panedwindow add $win.tframe -sticky news -height 100
    $win.panedwindow add $win.errormessage -sticky news

    pack $win.panedwindow -side top -fill both -expand yes


    my initTestCasesList

    next


}
