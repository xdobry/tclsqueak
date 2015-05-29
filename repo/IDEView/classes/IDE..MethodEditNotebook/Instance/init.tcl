IDE::MethodEditNotebook instproc init window {
    my instvar win freeid vtype toolbar saveButton
    set win $window
    # deprected TODO remove is source button removed
    set vtype Source
    set freeid 1

    ttk::notebook $win
    bind $win <<NotebookTabChanged>> [list [self] notebookTabChanged]

    set ms [my createEditorPopdownMenu]
    $ms buildPopDownMenu $win.epopdown [winfo toplevel $win]
    
    if {[info exists toolbar] && $toolbar ne ""} {
        set saveButton [$toolbar addCommand "Save/Accept" [list [self]::methodedit dispatchTab save] save_edit 1.2]
        $toolbar addCommand "Find/Replace" [list [self] findReplace] find 2.0
        $toolbar addCommand "Cut" [list [self] dispatchTab cut] cut_edit 2.1
        $toolbar addCommand "Copy" [list [self] dispatchTab copy] copy_edit 2.2
        $toolbar addCommand "Paste" [list [self] dispatchTab paste] paste_edit 2.3
        $toolbar addCommand "Check Syntax" [list [self] dispatchTab syntaxCheck] syntax_check 2.4
        $toolbar addSeparator 2.5
    }
    
    next
}
