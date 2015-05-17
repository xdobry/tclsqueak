IDE::Toolbar proc showTooltip {obj win} {
    if {[Object isobject $obj]} {
        $obj showTooltip $win
    }
}
