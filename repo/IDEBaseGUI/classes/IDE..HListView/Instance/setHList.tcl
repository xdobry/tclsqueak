IDE::HListView instproc setHList hl {
    my instvar hlist listItems
    set hlist $hl
    set listItems {}
    foreach tree $hlist {
        my rekListInit $tree ""
    }
    my setList $listItems
}
