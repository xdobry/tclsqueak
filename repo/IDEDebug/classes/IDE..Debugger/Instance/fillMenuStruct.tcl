IDE::Debugger instproc fillMenuStruct aMenuStruct {
    $aMenuStruct enablementHandler [self]

    $aMenuStruct addCommand {Inspect Object At Level} [list [self] inspectCalledObject]
}
