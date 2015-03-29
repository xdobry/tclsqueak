IDE::FileBrowser instproc newFolder {} {
     set nf [IDE::IDialogEntry getValue "New Folder Name"]
     if {$nf ne ""} {
         my instvar currentDic
         file mkdir [file join $currentDic $nf]
         my refreshFiles
     }
}
