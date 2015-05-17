IDE::Toolbar instproc addCommand {name command image {pos 1.0}} {
    my instvar win count winArr tooltips
    ::IDE::Toolbar createImage $image
    set btnwin $win.btn$count
    ttk::button $btnwin -image $image -takefocus 0 -command $command -style Toolbutton
    my addWin $btnwin $pos
    set tooltips($btnwin) $name
    bind $btnwin <Any-Enter> "after 1000 [list ::IDE::Toolbar showTooltip [self] %W]"
    bind $btnwin <Any-Leave> "after 1000 [list destroy %W.balloon]"
    incr count
    return $btnwin
}
