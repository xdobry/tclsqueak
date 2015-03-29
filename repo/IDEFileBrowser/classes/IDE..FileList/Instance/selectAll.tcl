IDE::FileList instproc selectAll {} {
    # !! Tk specific
    my instvar win
    $win.listbox selection set 0 end
}
