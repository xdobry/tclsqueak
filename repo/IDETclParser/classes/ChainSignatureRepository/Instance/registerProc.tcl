ChainSignatureRepository instproc registerProc {cmdName desc {namespace {}}} {
    my instvar writeRepository
    $writeRepository registerProc $cmdName $desc $namespace
}
