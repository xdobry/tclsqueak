IDE::TkWinList instproc fillMenuStruct ms {
    $ms enablementHandler [self]
    $ms addCommand2 {Serialize Widget} [list [self] dispatchWithSelected serializeWidgetAction] isValidSelection
    $ms addCommand2 {Destroy Widget} [list [self] dispatchWithSelected destroyWidget] isValidSelection
    $ms addCommand {Refresh} [list [self] refreshWidgets]
    next
}
