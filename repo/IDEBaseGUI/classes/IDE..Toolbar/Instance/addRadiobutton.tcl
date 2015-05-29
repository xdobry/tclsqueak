IDE::Toolbar instproc addRadiobutton {name command variable value image {pos 1.0}} {
    my instvar win count winArr
    ::IDE::Toolbar createImage $image
    set btnwin $win.btn$count
    ttk::radiobutton $btnwin -image $image -takefocus 0 -command $command -value $value -variable $variable -style Toolbutton
    my addWin $btnwin $pos
    my addTooltip $btnwin $name
    incr count
    return $btnwin
}
