IDE::Toolbar instproc addCheckbutton {name command variable image {pos 1.0}} {
    my instvar win count winArr
    ::IDE::Toolbar createImage $image
    set btnwin $win.btn$count
    ttk::checkbutton $btnwin -image $image -takefocus 0 -command $command -variable $variable -style Toolbutton
    my addWin $btnwin $pos
    my addTooltip $btnwin $name
    incr count
    return $btnwin
}
