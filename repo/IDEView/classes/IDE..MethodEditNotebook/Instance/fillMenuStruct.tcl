IDE::MethodEditNotebook instproc fillMenuStruct ms {
    $ms enablementHandler [self]
    my requireNamespace
    my set wrapMode 1

    $ms addMenuItem [IDE::MenuCommand new -childof $ms -name "New Tab" -command [list [self] newTab] -popdownMenu 1]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -name "Close Tab" -command [list [self] closeCurrentTab] -popdownMenu 1]
    $ms addSeparator

    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Alt-q -name {Do it} -command [list [self] dispatchTab evalSelection] -popdownMenu 0 -enableList isValidTextSelection]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Control-q -name {Print it} -command [list [self] dispatchTab evalDisplaySelection] -popdownMenu 0 -enableList isValidTextSelection]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Alt-x -name {Substitute it} -command [list [self] dispatchTab evalSubstituteSelection] -popdownMenu 0 -enableList isValidTextSelection]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Control-g -name {Inspect it} -command [list [self] dispatchTab evalInspectSelection] -popdownMenu 0 -enableList isValidTextSelection]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Control-r -name {Browse it} -command [list [self] dispatchTab browseSelection] -popdownMenu 0 -enableList isValidTextSelection]
    $ms addMenuItem [::IDE::MenuCommand new -childof $ms -name Find/Replace... -command [list [self] findReplace] -popdownMenu 0 -accelerator Control-r]
    $ms addMenuItem [::IDE::MenuCommand new -childof $ms -name Find -command [list [self] directFind] -popdownMenu 0 -accelerator Control-f]
    $ms addCommand "Go to line" [list [self] dispatchTab goToLine]
    $ms addCommand "mask non ASCII characters" [list [self] dispatchTab maskUTF8]
    $ms addMenuItem [IDE::MenuCheckbox new -childof $ms -name {Wrap Mode} -command [list [self] dispatchTab switchWrap] -varname [self]::wrapMode -accelerator Alt-w]
    $ms addCommand {File Out} [list [self] dispatchTab fileOut]
    $ms addCommand {File In} [list [self] dispatchTab fileIn]
    $ms addCommand {File Append} [list [self] dispatchTab fileAppend]

    $ms addSeparator
    set m [IDE::MenuStruct create ${ms}::codeoperation {Code Operation}]
    $ms addCascadeMenu $m
    $m addCommand {Add Indent} [list [self] dispatchTab addIndent]
    $m addCommand {Minus Indent} [list [self] dispatchTab minusIndent]
    $m addCommand {Format} [list [self] dispatchTab autoIndent] {} {Control-F}
    $m addCommand {Comment} [list [self] dispatchTab commentRegion]
    $m addCommand {Uncomment} [list [self] dispatchTab uncommentRegion]
    $m addCommand {make msgcat::mc getter} [list [self] dispatchTab makeMCGetter] {} {Alt-i}

    set m [IDE::MenuStruct create ${ms}::vcontrol {Syntax Hightlight}]
    $ms addCascadeMenu $m
    $m addRadioButton {No Syntax Highlight} IDEPreferences::syntaxHightlight {} 0
    $m addRadioButton {Simple Syntax Highlight} IDEPreferences::syntaxHightlight {} 1
    $m addRadioButton {Complext Syntax Highlight} IDEPreferences::syntaxHightlight {} 2
    $m addSeparator
    $m addCommand {Force Syntax Check} [list [self] dispatchTab syntaxCheck]
    $m addCommand {Drop Syntax Highlight} [list [self] dispatchTab syntaxHighlightRemove]

    $ms addCheckButton {Syntaxcheck on Save} IDEPreferences::syntaxCheck
    $ms addCommand {Show definition} [list [self] showRef] {} F3

    $ms addCommand {Set Breakpoint} [list [self] dispatchTab setBreakpoint] {} {} 0 {canSetBreakpoint haveNoChanges}

    $ms addSeparator
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Control-s -name Save/Accept -command [list [self] dispatchTab save] -popdownMenu 0]
}
