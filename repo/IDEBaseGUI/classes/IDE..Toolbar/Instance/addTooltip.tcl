IDE::Toolbar instproc addTooltip {win description} {
    my instvar tooltips
    set tooltips($win) $description
    bind $win <Any-Enter> "after 1000 [list ::IDE::Toolbar showTooltip [self] %W]"
    bind $win <Any-Leave> "after 1000 [list destroy %W.balloon]"
}
