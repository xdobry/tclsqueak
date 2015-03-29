IDE::DirectFind instproc show {} {
    my instvar win parentWin curMarkSelection curMarkSelectionNext
    if {$win ni [pack slaves $parentWin]} {
        pack $win -in $parentWin -side left
        set curMarkSelection 1.0
        set curMarkSelectionNext 1.0
        $win.entry delete 0 end
    }
    focus $win.entry
}
