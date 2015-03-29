IDE::FileBrowser instproc changeToHome {} {
    global env
    my set currentDic $env(HOME)
    my refreshFiles
}
