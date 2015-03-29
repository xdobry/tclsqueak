IDE::FindReplace proc destroySignalFromView tview {
    my instvar view 
    if {$tview!=$view} return
    set view {}
    my hideWindow
}
