IDE::MethodEditNotebook instproc updateTitle {oldDesc newDesc} {
    my instvar viewContent win methodEditTabIds
    if {![catch {set viewContent($oldDesc)} view]} {
        $win tab $methodEditTabIds($view) -text [my getTabTitle {*}${newDesc}]
        unset viewContent($oldDesc)
        set viewContent($newDesc) $view
        $view updateContentDescr $newDesc
    }
}
