IDE::VariableTraceList instproc fillMenuStruct ms {
    $ms enablementHandler [self]
    $ms addCommand2 {Remove Read Trace} [list [self] dispatchParentWithSelected removeReadTrace] isValidSelection
    $ms addCommand2 {Remove Write Trace} [list [self] dispatchParentWithSelected removeWriteTrace] isValidSelection
    $ms addCommand2 {Remove Watch} [list [self] dispatchParentWithSelected removeWatch] isValidSelection
    $ms addCommand2 {Remove All Traces} [list [self] dispatchParentWithSelected removeAllTraces] isValidSelection
    $ms addSeparator
    $ms addCommand2 {Remove All Watches} [list [self] removeAllWatches] isAnyWatch
    next
}
