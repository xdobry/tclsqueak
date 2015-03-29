IDE::CellWindow instproc specificInit {} {
    my instvar win
    IDE::Text [self]::resulttext $win.resulttext [list -height 16] [list -width 60]

    grid $win.resulttext -row 0 -column 0 -sticky news
    
    grid columnconfigure $win 0 -weight 1
    grid rowconfigure $win 0 -weight 1
    next
}
