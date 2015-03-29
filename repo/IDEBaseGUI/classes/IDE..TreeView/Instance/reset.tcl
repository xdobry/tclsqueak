IDE::TreeView instproc reset {} {
    my instvar win
    set twin $win.listbox
    $twin delete [$twin children {}]
}
