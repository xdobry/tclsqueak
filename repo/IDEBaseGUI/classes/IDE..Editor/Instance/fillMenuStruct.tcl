IDE::Editor instproc fillMenuStruct ms {
    $ms enablementHandler [self]
    my requireNamespace
    my set wrapMode 1

    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Alt-q -name {Do it} -command [list [self] evalSelection] -popdownMenu 1 -enableList isValidTextSelection]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Control-q -name {Print it} -command [list [self] evalDisplaySelection] -popdownMenu 1 -enableList isValidTextSelection]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Alt-x -name {Substitute it} -command [list [self] evalSubstituteSelection] -popdownMenu 1 -enableList isValidTextSelection]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Control-g -name {Inspect it} -command [list [self] evalInspectSelection] -popdownMenu 1 -enableList isValidTextSelection]
    $ms addMenuItem [IDE::MenuCommand new -childof $ms -accelerator Control-r -name {Browse it} -command [list [self] browseSelection] -popdownMenu 1 -enableList isValidTextSelection]
    $ms addMenuItem [::IDE::MenuCommand new -childof $ms -name Find/Replace... -command [list IDE::FindReplace bindToView [self]] -popdownMenu 1 -accelerator Control-r]
    if {[my exists directFind]} {
        $ms addMenuItem [::IDE::MenuCommand new -childof $ms -name Find -command [list [my set directFind] show [my getTextWindow]] -popdownMenu 1 -accelerator Control-f]
    }
    $ms addCommand "Go to line" [list [self] goToLine]
    $ms addCommand "mask non ASCII characters" [list [self] maskUTF8]
    $ms addMenuItem [IDE::MenuCheckbox new -childof $ms -name {Wrap Mode} -command [list [self] switchWrap] -varname [self]::wrapMode -accelerator Alt-w]
    $ms addCommand {File Out} [list [self] fileOut]
    $ms addCommand {File In} [list [self] fileIn]
    $ms addCommand {File Append} [list [self] fileAppend]
    my menuInsertions $ms
    next
}
