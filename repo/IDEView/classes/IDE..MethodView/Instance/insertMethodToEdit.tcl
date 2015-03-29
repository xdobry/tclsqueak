IDE::MethodView instproc insertMethodToEdit y {
    my instvar win listItems
    [my info parent]::methodedit appendToCursor "[lindex $listItems [$win.listbox nearest $y]] "
}
