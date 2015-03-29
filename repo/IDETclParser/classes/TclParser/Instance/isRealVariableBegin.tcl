TclParser instproc isRealVariableBegin {} {
    my instvar stream
    $stream addPos 1
    set firstChar [$stream getChar]
    $stream addPos -1
    regexp {[\w\{:]} $firstChar
}
