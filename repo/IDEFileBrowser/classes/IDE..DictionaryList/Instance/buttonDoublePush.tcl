IDE::DictionaryList instproc buttonDoublePush {} {
    set dic [my selectedItemFirst]
    if {$dic ne ""} {
        [my info parent] selectDic $dic
    }
}
