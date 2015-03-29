IDE::SqlBrowser instproc specificInit {} {
    my instvar win ignoreKnownComponents resultshow
    my requireNamespace
    
    my set history [list]
    my set historyIndex -1
    
    panedwindow $win.pannedwindow -orient vertical
    frame $win.connectframe
    frame $win.schema
    button $win.connect -command [list [self] connectDB] -text "Connect DB"
    label $win.connectionlab
    button $win.disconnect -command [list [self] disconnectDB] -text "Disonnect"
    IDE::NListView create [self]::@tables $win.schema.tables -height 3 -label Tables -notify [self] -notifyProc changeTable -doubleNotifyProc insertElem
    IDE::NListView create [self]::@columns $win.schema.columns -height 3 -label Columns -notify [self] -doubleNotifyProc insertElem

    frame $win.editor
    IDE::SQLEditor create [self]::@sqlquerry $win.sqlquerry -height 1
    button $win.run -command [list [self] runQuerry] -text "Execute Ctrl-e" -state disabled
    button $win.back -command [list [self] backQuerry] -text "Back" -state disabled
    button $win.forward -command [list [self] forwardQuerry] -text "Forward" -state disabled
    
    frame $win.result
    set resultshow text
    my requireNamespace
    
    frame $win.result.rbframe
    radiobutton $win.result.showtext -text "text" -variable [self]::resultshow -command [list [self] changeResultShow] -value text
    radiobutton $win.result.showtable -text "table" -variable [self]::resultshow -command [list [self] changeResultShow] -value table
    pack $win.result.showtext $win.result.showtable -in $win.result.rbframe -side left
    
    IDE::Text create [self]::@sqlresult $win.result.sqlresult -height 1
    frame $win.result.tableframe
    scrollbar $win.result.ytablescroll -command [list $win.result.table yview]
    scrollbar $win.result.xtablescroll -command [list $win.result.table xview] -orient horizontal
    table $win.result.table -yscrollcommand [list $win.result.ytablescroll set] -xscrollcommand [list $win.result.xtablescroll set] -cache yes -height 12 -anchor w -browsecommand [list [self] browseCell %r %c]
    grid $win.result.table -in $win.result.tableframe -column 0 -row 0 -sticky news
    grid $win.result.ytablescroll -in $win.result.tableframe -column 1 -row  0 -sticky nws
    grid $win.result.xtablescroll -in $win.result.tableframe -column 0 -row  1 -sticky nwe
    grid columnconfig $win.result.tableframe 0 -weight 1
    grid rowconfig $win.result.tableframe 0 -weight 1

    
    pack $win.schema.tables $win.schema.columns -side left -expand yes -fill both
    pack $win.schema -in $win.connectframe -expand yes -fill both -side bottom
    pack $win.connect $win.disconnect $win.connectionlab -side left -in $win.connectframe

    pack $win.sqlquerry -in $win.editor  -expand yes -fill both
    pack $win.run -in $win.editor -anchor w -side left
    pack $win.back -in $win.editor -anchor w -side left
    pack $win.forward -in $win.editor -anchor w -side left
    
    pack $win.result.rbframe -anchor w
    pack $win.result.sqlresult -expand yes -fill both

    $win.pannedwindow add $win.connectframe  -sticky news -height  110
    $win.pannedwindow add $win.editor  -sticky news -height  110
    $win.pannedwindow add $win.result -sticky news -height  180
    pack $win.pannedwindow -expand yes -fill both
    next
}
