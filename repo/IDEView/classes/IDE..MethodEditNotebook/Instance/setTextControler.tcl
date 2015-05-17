IDE::MethodEditNotebook instproc setTextControler args {
    my instvar methodEditTabIds win
    set currentEdit [my getCurrentMethodEdit]
    if {$currentEdit ne "" && ![$currentEdit hasModifications]} {
        my removeContentRel $currentEdit
        $currentEdit setTextControler {*}$args
        $win tab $methodEditTabIds($currentEdit) -text "Comment"
    } else {
        [my newTab Comment] setTextControler {*}$args
    }
}
