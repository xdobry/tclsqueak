IDE::MethodView instproc init args {
    my instvar vclass win history historyIndex vtype inheritedMethod editHistory
    # saveEdit need vtype
    set vtype Instance
    set history [list]
    set editHistory [list]
    set historyIndex -1
    set vclass {}
    set inheritedMethod 0
    next
    bind $win.listbox <2> [list [self] insertMethodToEdit %y]
    bind $win.listbox <Insert> [list [self] newMethodTemplate]
}
