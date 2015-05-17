IDE::MethodEditNotebook instproc init window {
    my instvar win freeid vtype
    set win $window
    # deprected TODO remove is source button removed
    set vtype Source
    set freeid 1

    ttk::notebook $win
    bind $win <<NotebookTabChanged>> [list [self] notebookTabChanged]

    set ms [my createEditorPopdownMenu]
    $ms buildPopDownMenu $win.epopdown [winfo toplevel $win]
    next
}
