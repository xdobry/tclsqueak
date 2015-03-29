IDE::SqlBrowser instproc showCellWindow {} {
    if {![Object isobject [self]::@cellWindow]} {
        IDE::CellWindow create [self]::@cellWindow  [Object autoname .sqlcell]
    }
}
