IDE::Debugger instproc fillMenuStruct aMenuStruct {
    $aMenuStruct enablementHandler [self]

    $aMenuStruct addCommand2 {Inspect Object At Level} [list [self] inspectCalledObject] isFrameOnObject
}
