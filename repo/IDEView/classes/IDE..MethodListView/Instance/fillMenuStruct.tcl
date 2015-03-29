IDE::MethodListView instproc fillMenuStruct ms {
    $ms enablementHandler [self]
    $ms addCommand2 {Remove form List} [list [self] dispatchWithSelected removeMethod] isValidSelection
    $ms addCommand2 {Heritage Browser} [list [self] dispatchWithSelected browseHeritage] isValidSelection
    $ms addCommand2 {Children Browser} [list [self] dispatchWithSelected browseChildren] isValidSelection
    $ms addCommand2 {Search Senders} [list [self] dispatchWithSelected searchSenders] isValidSelection
    $ms addCommand2 {Search Implementors} [list [self] dispatchWithSelected searchImplementors] isValidSelection
    $ms addSeparator
    $ms addCommand {View next item} [list [self] selectNextItem] {} Alt-n
    $ms addCommand {View previous item} [list [self] selectPrevItem] {} Alt-p
    my menuInsertions $ms
    next
}
