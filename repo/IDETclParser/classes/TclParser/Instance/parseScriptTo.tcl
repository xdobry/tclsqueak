TclParser instproc parseScriptTo parent {
    my instvar stream
    my skipBlanks
    while {![$stream atEnd]} {
        $parent addElem [my getCommandOrComment $parent]
        my skipBlanks
    }
}
