IDE::MountList instproc buttonDoublePush {} {
    set item [my selectedItemFirst]
    if {$item ne ""} {
        [my info parent] changeDic $item
    }
}
