IDE::SyntaxCheckMethodList instproc fillMenuStruct ms {
    $ms enablementHandler [self]
    $ms addCommand2 {Remove from List} [list [self] dispatchWithSelected removeMethod] isValidSelection
    $ms addCommand2 {Heritage Browser} [list [self] dispatchWithSelected browseHeritage] isValidSelection
    $ms addCommand2 {Children Browser} [list [self] dispatchWithSelected browseChildren] isValidSelection
    $ms addCommand2 {Search Senders} [list [self] dispatchWithSelected searchSenders] isValidSelection
    my menuInsertions $ms
    next
}
