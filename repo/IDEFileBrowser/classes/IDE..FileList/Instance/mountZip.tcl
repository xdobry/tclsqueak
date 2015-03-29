IDE::FileList instproc mountZip file {
    [my info parent] newMount zip [file join [[my info parent] set currentDic] $file] $file
}
