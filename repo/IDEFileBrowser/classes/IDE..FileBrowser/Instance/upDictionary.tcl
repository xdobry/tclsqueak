IDE::FileBrowser instproc upDictionary {} {
    my instvar currentDic 
    set currentDic [file dirname $currentDic]
    my refreshFiles
}
