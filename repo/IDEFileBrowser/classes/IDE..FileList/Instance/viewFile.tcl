IDE::FileList instproc viewFile file {
    set w [IDE::Transcript newBrowser]
    $w @editor openFile [file join [[my info parent] set currentDic] $file]
}
