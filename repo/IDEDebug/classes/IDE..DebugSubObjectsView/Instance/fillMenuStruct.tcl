IDE::DebugSubObjectsView instproc fillMenuStruct ms {
    $ms addCommand {Inspect called Object} [list [self] inspectCalledObject]
    $ms addCommand {Inspect Subobject in new} [list [self] inspectObject]
}
