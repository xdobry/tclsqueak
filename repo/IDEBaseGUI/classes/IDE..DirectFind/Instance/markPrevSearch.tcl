IDE::DirectFind instproc markPrevSearch {} {
    my instvar win textWin curMarkSelectionNext
    if {![winfo exists $textWin]} {
        my endFind
        return
    }
    set searchText [$win.entry get]
    $textWin tag remove silbingSelect 1.0 end
    if {$searchText ne ""} {
        set cur [$textWin search -backwards -count count -- $searchText $curMarkSelectionNext 1.0]
        if {$cur ne ""} {
            set endIndex [$textWin index "$cur + $count char"]
            $textWin tag add silbingSelect $cur $endIndex
            $textWin see $cur
            set curMarkSelectionNext $cur
        } else {
            set curMarkSelectionNext end
        }
    }
}
