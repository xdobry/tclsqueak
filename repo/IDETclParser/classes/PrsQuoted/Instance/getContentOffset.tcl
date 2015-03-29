PrsQuoted instproc getContentOffset {} {
    my instvar hasQuote
    expr {$hasQuote ? 1 : 0}
}
