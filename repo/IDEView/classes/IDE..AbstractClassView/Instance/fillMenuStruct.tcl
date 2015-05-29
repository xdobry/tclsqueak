IDE::AbstractClassView instproc fillMenuStruct ms {
    $ms enablementHandler [self]
    $ms addCommand2 {Open Hierarchy...} [list [self] dispatchWithSelected browseHeritage] {isValidSelection isSelectionClass}
    $ms addCommand2 {Open Subtype Hierarchy...} [list [self] dispatchWithSelected browseChildren] {isValidSelection isSelectionClass}
    $ms addCommand2 {Search References} [list [self] dispatchWithSelected searchUsage] isValidSelection
    $ms addCommand2 {Track This Class} [list [self] dispatchWithSelected trackClass] isValidSelection
    $ms addCommand2 {Create Instance...} [list [self] dispatchWithSelected createInstance] {isValidSelection isSelectionClass}
    $ms addCommand2 {Inspect All Instances} [list [self] dispatchWithSelected inspectAllInstances] isValidSelection
    $ms addCommand2 {Export To File...} [list [self] dispatchWithSelected exportToFile] isValidSelection
    next
}
