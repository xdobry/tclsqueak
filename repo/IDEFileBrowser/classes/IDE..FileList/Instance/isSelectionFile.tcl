IDE::FileList instproc isSelectionFile {} {
    set first [my selectedItemFirst]
    file isfile [file join [my getCurrent] $first]
}
