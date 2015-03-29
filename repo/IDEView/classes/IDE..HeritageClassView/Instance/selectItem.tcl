IDE::HeritageClassView instproc selectItem tclass {
    my instvar introProxy
    set class [string trimleft $tclass]
    if {[Object isobject [my info parent]::methodcatview]} {
        [my info parent]::methodcatview selectFor $class Classes $introProxy
    }
    if {$class eq ""} return
    my set actItem $class
    my refreshView
}
