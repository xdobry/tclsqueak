SyntaxHighlightVisitor instproc init {} {
    my instvar context text
    if {[info exists context] && [info exists text]} {
        $text setVariableTypes [$context getVariableTypes]
    }
}
