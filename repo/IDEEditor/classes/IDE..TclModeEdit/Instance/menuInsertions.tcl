IDE::TclModeEdit instproc menuInsertions ms {
    set m [IDE::MenuStruct create ${ms}::codeoperation {Code Operation}]
    $ms addCascadeMenu $m
    $m addCommand {Add Indent} [list [self] addIndent]
    $m addCommand {Minus Indent} [list [self] minusIndent]
    $m addCommand {Format} [list [self] autoIndent] {} {Control-F}
    $m addCommand {Comment} [list [self] commentRegion]
    $m addCommand {Uncomment} [list [self] uncommentRegion]
    $m addCommand {make msgcat::mc getter} [list [self] makeMCGetter] {} {Alt-i}

    set m [IDE::MenuStruct create ${ms}::vcontrol {Syntax Hightlight}]
    $ms addCascadeMenu $m
    $m addCommand {Force Syntax Check} [list [self] syntaxCheck]
    $m addCommand {Drop Syntax Highlight} [list [self] syntaxHighlightRemove]

    set twin [my getTextWindow]
    $ms addCommand {Show definition} "[self] showRef \[$twin tag names current\]" {} F3

    $ms addCommand2 {Set Breakpoint} [list [self] setBreakpoint] {canSetBreakpoint haveNoChanges}
}
