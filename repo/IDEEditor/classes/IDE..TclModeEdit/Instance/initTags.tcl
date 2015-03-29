IDE::TclModeEdit instproc initTags {} {
    set twin [my getTextWindow]
    $twin tag configure comment -foreground red
    $twin tag configure quoted -foreground SpringGreen3
    # full hightligthing
    $twin tag configure variable -foreground blue
    $twin tag configure tvariable -foreground blue4
    $twin tag configure tclproc -foreground brown
    $twin tag configure ref -underline 1
    next
}
