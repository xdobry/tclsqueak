IDE::FileBrowser instproc selectDic dic {
    my instvar currentDic 
    set currentDic [file join $currentDic $dic]
    my refreshFiles
}
