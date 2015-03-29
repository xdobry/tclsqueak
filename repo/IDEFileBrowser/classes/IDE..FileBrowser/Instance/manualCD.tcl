IDE::FileBrowser instproc manualCD {} {
    set ncd [IDE::IDialogEntry getValue "Change to folder"]
    if {$ncd ne ""} {
        if {![file isdirectory $ncd]} {
            IDE::Dialog message "'$ncd' is not directory"
        } else {
            my set currentDic $ncd
            my refreshFiles
        }
    }
}
