IDE::MethodEditNotebook instproc setBodyTextControler {tvclass tvtype tmethod controler} {
    my instvar methodEditTabIds win viewContent
    set key [list $tvclass $tvtype $tmethod]
    if {![catch {set viewContent($key)} view]} {
        set tabid $methodEditTabIds($view)
        set currentTabid [$win select]
        if {$currentTabid eq $tabid} {
            $view setBodyTextControler $tvclass $tvtype $tmethod $controler
            $win tab $tabid -text [my getTabTitle $tvclass $tvtype $tmethod]
        } else {
            $win select $tabid
        }
        return
    }
    set currentEdit [my getCurrentMethodEdit]
    if {$currentEdit ne "" && ![$currentEdit hasModifications]} {
        my removeContentRel $currentEdit
        $currentEdit setBodyTextControler $tvclass $tvtype $tmethod $controler
        $win tab $methodEditTabIds($currentEdit) -text [my getTabTitle $tvclass $tvtype $tmethod]
    } else {
        set currentEdit [my newTab [my getTabTitle $tvclass $tvtype $tmethod]]
        $currentEdit setBodyTextControler $tvclass $tvtype $tmethod $controler
    }
    set viewContent($key) $currentEdit
}
