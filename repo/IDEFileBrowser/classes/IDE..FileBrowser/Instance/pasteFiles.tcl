IDE::FileBrowser instproc pasteFiles {} {
    my instvar action pfiles pdic currentDic
    if {$action eq "copy"} {
        set op copy
    } else {
        set op rename
    }
    set yesToAll 0
    foreach f $pfiles {
        if {!$yesToAll && [file exists [file join $currentDic $f]]} {
            set ret [tk_dialog .dlg "file paste" "file '$f' already exists. overwrite it?" {} Yes Yes No YesToAll Cancel]
            if {$ret eq "No"} continue
            if {$ret eq "Cancel"} break
            if {$ret eq "YesToAll"} {
                set yesToAll 1            
            }
        }
        file $op -force -- [file join $pdic $f] $currentDic
    }
    if {$action eq "cut"} {
        set action {}
    }
    my refreshFiles
}
