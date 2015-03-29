IDE::FileBrowser instproc specificInit {} {
    my instvar win currentDic history historyIndex
    global tcl_platform
    set currentDic [file normalize [pwd]]
    set history [list $currentDic]
    set historyIndex 0
    label $win.current -relief solid -border 2 -width 50 -anchor w -text $currentDic
    frame $win.buttons
    button $win.buttons.up -text "up dictionary" -command [list [self] upDictionary]
    button $win.buttons.home -text "home" -command [list [self] changeToHome]
    button $win.buttons.back -text "<<" -command [list [self] backHistory]
    button $win.buttons.forward -text ">>" -command [list [self] forwardHistory]
    button $win.buttons.working -text "working dir" -command [list [self] changeToWorking]
    pack $win.buttons.up $win.buttons.home $win.buttons.back $win.buttons.forward $win.buttons.working -side left -anchor w
    panedwindow $win.f -orient horizontal
    frame $win.f.df
    IDE::MountList [self]::@volumes $win.f.df.volumes -height 5 -label "Volumes and Mounts"
    IDE::DictionaryList [self]::@directories $win.f.df.directories -label Directories
    pack $win.f.df.volumes  -fill both
    pack $win.f.df.directories -fill both -expand yes
    $win.f add $win.f.df -sticky news -width 200
    IDE::FileList [self]::@files $win.f.files -multiselect 1 -label Files
    $win.f add $win.f.files -sticky news
    pack $win.current -anchor w -fill x
    pack $win.buttons -anchor w
    pack $win.f -expand yes -fill both
    my refreshFiles
    next
}
