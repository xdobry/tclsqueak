IDE::VarsView instproc fillMenuStruct ms {
    $ms enablementHandler [self]
    $ms addCommand2 {Inspect as Object} [list [self] dispatchWithSelected inspectAsObject] {isValidSelection isNotSelectionArray}
    $ms addCommand2 {Inspect as Objects List} [list [self] dispatchWithSelected inspectAsObjectsList] {isValidSelection isNotSelectionArray}
    $ms addCommand2 {Inspect as List} [list [self] dispatchWithSelected inspectAsList] {isValidSelection isNotSelectionArray}
    $ms addCommand2 {Inspect as Dict} [list [self] dispatchWithSelected inspectAsDict] {isValidSelection isNotSelectionArray}
    $ms addCommand2 {Inspect Array} [list [self] dispatchWithSelected inspectArray] {isValidSelection isSelectionArray}
    $ms addCommand2 {Search References} [list [self] dispatchWithSelected searchReferences] isValidSelection
    $ms addSeparator
    $ms addCommand2 {Debug on Read Access} [list [self] dispatchWithSelected addToReadTrace] {isValidSelection isNotSelectionArray}
    $ms addCommand2 {Debug on Write Access} [list [self] dispatchWithSelected addToWriteTrace] {isValidSelection isNotSelectionArray}
    $ms addCommand2 {Watch Variable} [list [self] dispatchWithSelected addToWatch] {isValidSelection isNotSelectionArray}
    $ms addSeparator
    $ms addCommand2 {Unset Variable} [list [self] dispatchWithSelected unsetVariable] isValidSelection
    $ms addCommand2 {Refresh} [list [self] refresh] hasObject
    next
}
