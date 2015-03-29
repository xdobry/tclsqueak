IDE::SyntaxChecker instproc fillMenuStruct aMenuStruct {
    $aMenuStruct addCommand {Protokoll to File} [list [self] protokollToFile]
}
