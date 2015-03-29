IDE::TrackedMethodList instproc fillMenuStruct ms {
    $ms enablementHandler [self]
    $ms addCommand2 {Browse} [list [self] dispatchWithSelected browseSelected] isValidSelection
    $ms addCommand2 {Remove From List} [list [self] dispatchWithSelected removeTrackItem] isValidSelection
    next
}
