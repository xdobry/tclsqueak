IDE::ObjectMethodView instproc fillMenuStruct ms {
    my set visibility MinusRoot
    $ms enablementHandler [self]

    $ms addCommand2 Invoke [list [self] dispatchWithSelected invokeMethod] isValidSelection
    $ms addCommand2 {Search Senders} [list [self] dispatchWithSelected searchSenders] isValidSelection
    $ms addCommand2 {Search Implementors} [list [self] dispatchWithSelected searchImplementors] isValidSelection
    $ms addRadioButton {Visibility All} [self]::visibility [list [self] changeVisibility] All
    $ms addRadioButton {Visibility Class} [self]::visibility [list [self] changeVisibility] Class
    $ms addRadioButton {Visibility All%::xotcl::Object} [self]::visibility [list [self] changeVisibility] MinusRoot
    $ms addCheckButton {no mixin methods} [self]::hideMixinMethod [list [self] changeVisibility]
    $ms addCheckButton {only instcommands} [self]::hideProcsMethod [list [self] changeVisibility]
    $ms addCheckButton {only procs} [self]::hideNoCmds [list [self] changeVisibility]
    $ms addCommand2 Refresh [list [self] changeVisibility]
}
