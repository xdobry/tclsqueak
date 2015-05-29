IDE::Toolbar instproc addCommand {name command image {pos 1.0}} {
    my instvar win count winArr
    ::IDE::Toolbar createImage $image
    set btnwin $win.btn$count
    ttk::button $btnwin -image $image -takefocus 0 -command $command -style Toolbutton
    my addWin $btnwin $pos
    my addTooltip $btnwin $name
    incr count
    return $btnwin
}
