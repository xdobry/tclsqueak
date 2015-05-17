IDE::XOIntroProxy instproc getParentForObject object {
    set p [$object info parent]
    if {$p ne "" && [Object isobject $p]} {
        return $p
    }
    return
}
