IDE::StackMethodListView instproc fillMenuStruct ms {
    $ms addCommand2 {Try inspect Object} [list [self] inspectObject]
    $ms addCommand2 {Heritage Browser} [list [self] dispatchWithSelected browseHeritage]
    $ms addCommand2 {Children Browser} [list [self] dispatchWithSelected browseChildren]
}
