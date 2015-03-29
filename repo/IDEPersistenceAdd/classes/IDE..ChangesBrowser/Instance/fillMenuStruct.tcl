IDE::ChangesBrowser instproc fillMenuStruct aMenuStruct {
    $aMenuStruct enablementHandler [self]
    $aMenuStruct addCommand {Produce Changes Script} [list [self] produceChangesScript]
}
