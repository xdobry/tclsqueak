IDE::DirectFind instproc markNextSearch {} {
    my instvar win textWin curMarkSelectionNext
    set searchText [$win.entry get]
    $textWin tag remove silbingSelect 1.0 end
    if {$searchText ne ""} {
        set cur [$textWin search -count count -- $searchText $curMarkSelectionNext end]
        if {$cur ne ""} {
            set endIndex [$textWin index "$cur + $count char"]
            $textWin tag add silbingSelect $cur $endIndex
            $textWin see $cur
            set curMarkSelectionNext $endIndex
        } else {
            set curMarkSelectionNext 1.0
        }
    }
}
