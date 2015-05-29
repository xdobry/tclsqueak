IDE::MethodEditNotebook instproc notifyEdited contentDesc {
    my instvar viewContent methodEditTabIds win
    if {![catch {set viewContent($contentDesc)} view]} {
        $win tab $methodEditTabIds($view) -text *[my getTabTitle {*}${contentDesc}]
    }
}
