IDE::SubObjectsView instproc fillMenuStruct ms {
    $ms enablementHandler [self]
    
    $ms addCommand2 {Inspect in new window} [list [self] inspectObject] isValidSelection
    $ms addCommand2 {Inspect in this window} [list [self] inspectObjectInThis] isValidSelection
    $ms addCommand2 {Inspect Parent} [list [my info parent] inspectParent] isValidParent
    $ms addCommand2 {Refresh} [list [self] refresh] hasObject
    next
}
