IDE::CompBrowser instproc showToolPanel {} {
    my instvar win
    set toolpanelObj [self]::@toolpanel
    #ttc vartype methodListView xotcl IDE::MethodListView
    if {![Object isobject $toolpanelObj]} {
        IDE::TabPanel create $toolpanelObj $win.toolpanel
    }
    if {![winfo viewable $win.toolpanel]} {
        $win.lowerarea add $win.toolpanel -width 250
    }
    return $toolpanelObj
}
