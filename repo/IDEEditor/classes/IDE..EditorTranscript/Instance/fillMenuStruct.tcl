IDE::EditorTranscript instproc fillMenuStruct ms {
    $ms enablementHandler [self]
    $ms addCommand {New} [list [self] fileNew] 0 Control-n
    $ms addCommand {Open File} [list [self] fileIn] 0 Control-o
    $ms addCommand {Append File} [list [self] fileAppend] 0 Control-p
    $ms addCommand {Save File} [list [self] fileSave] 0 Control-s
    $ms addCommand {Save File As} [list [self] fileOut] 5
    $ms addSeparator
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Alt-q -name {Do it} -command [list [self] evalSelection] -popdownMenu 1 -enableList isValidTextSelection]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Control-q -name {Print it} -command [list [self] evalDisplaySelection] -popdownMenu 1 -enableList isValidTextSelection]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Alt-x -name {Substitute it} -command [list [self] evalSubstituteSelection] -popdownMenu 1 -enableList isValidTextSelection]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Control-g -name {Inspect it} -command [list [self] evalInspectSelection] -popdownMenu 1 -enableList isValidTextSelection]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Control-r -name {Browse it} -command [list [self] browseSelection] -popdownMenu 1 -enableList isValidTextSelection]
    $ms addSeparator
    $ms addMenuItem [IDE::MenuCheckbox new -childof $ms -name {Wrap Mode} -command [list [self] switchWrap] -varname [self]::wrapMode -accelerator Alt-w]
    $ms addCommand "Go to line..." [list [self] goToLine]
    $ms addCommand "Format" [list [self] autoIndent]
    $ms addCommand "Syntax Check" [list [self] syntaxCheck]

    $ms addMenuItem [::IDE::MenuCommand new -childof $ms -name Find/Replace -command [list IDE::FindReplace bindToView [self]] -popdownMenu 1 -accelerator Alt-f]

    if {[[my info parent] isTranscript]} {
        my set stdOutTie 0
        $ms addCheckButton "Forward 'puts' outputs" [self]::stdOutTie [list [self] changeStdOutTie]
    }
}
