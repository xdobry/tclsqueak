IDE::NSElements instproc fillMenuStruct ms {
    $ms enablementHandler [self]
    $ms addCommand2 Invoke [list [self] invoke] isInvokable
    $ms addCommand2 Remove [list [self] remove] isRemovable
    $ms addCommand2 {Inspect Array} [list [self] inspectArray] isArray
    $ms addSeparator
    $ms addCommand2 Refresh [list [self] refresh]
}
