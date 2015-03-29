IDE::DirectFind instproc keyChanged {} {
    my instvar win textWin lastSearchText curMarkSelection curMarkSelectionNext
    set searchText [$win.entry get]
    if {$lastSearchText eq $searchText} return
    set lastSearchText $searchText
    $textWin tag remove hlight 1.0 end
    $textWin tag remove silbingSelect 1.0 end
    set hasMarked 0
    if {$searchText ne ""} {
        set cur 1.0
        while 1 {
            set cur [$textWin search -count count -- $searchText $cur end]
            if {$cur ne ""} {
                set endIndex [$textWin index "$cur + $count char"]
                if {!$hasMarked && [$textWin compare $curMarkSelection <= $cur]} {
                   set hasMarked 1
                   $textWin tag add silbingSelect $cur $endIndex
                   set curMarkSelection $cur
                   set curMarkSelectionNext $endIndex
                } else {
                    $textWin tag add hlight $cur $endIndex
                }
                set cur $endIndex
            } else {
                break
            }
        }
    }
}
