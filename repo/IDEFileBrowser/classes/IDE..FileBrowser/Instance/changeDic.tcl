IDE::FileBrowser instproc changeDic dic {
    my instvar currentDic 
    set currentDic $dic
    my refreshFiles
}
