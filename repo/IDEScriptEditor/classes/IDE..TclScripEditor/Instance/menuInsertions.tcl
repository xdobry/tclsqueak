IDE::TclScripEditor instproc menuInsertions ms {
    $ms addCommand {Syntax Check} [list [self] syntaxCheck]
    $ms addCommand {Run Script} [list [self] runScript]
}
