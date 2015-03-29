IDE::FileList instproc mountKit file {
    [my info parent] newMount mk4 [file join [[my info parent] set currentDic] $file] $file
}
