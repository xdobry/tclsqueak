IDE::TkWinList instproc buttonDoublePush {} {
    set item [my selectedItemFirst]
    if {$item ne ""} {
        my selectFor $item
    }
}
