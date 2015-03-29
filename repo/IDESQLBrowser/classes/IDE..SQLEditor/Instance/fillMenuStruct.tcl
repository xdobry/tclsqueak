IDE::SQLEditor instproc fillMenuStruct ms {
    $ms enablementHandler [self]
 
    $ms addMenuItem [::IDE::MenuCommand new -childof $ms -name Execute -command [list [self] execute] -popdownMenu 1 -accelerator Control-e]
    $ms addCommand {Show Cell in Separate Window} [list [[self] info parent] showCellWindow]
    $ms addCommand {Refresh Tables} [list [[self] info parent] refreshTables]
    $ms addSeparator
    
    $ms addMenuItem [::IDE::MenuCommand new -childof $ms -name Find/Replace -command [list IDE::FindReplace bindToView [self]] -popdownMenu 1 -accelerator Alt-f]

    $ms addCommand {File Out} [list [self] fileOut]
    $ms addCommand {File In} [list [self] fileIn]
    $ms addCommand {File Append} [list [self] fileAppend]
    my menuInsertions $ms
}
