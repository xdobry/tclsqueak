PrsQuoted instproc isVariablePlusLiteral {} {
    # something like $a.re ".re" is literal
    # or $a.$b
    my instvar list begin hasQuote
    expr {!$hasQuote && [info exists list] && [llength $list]>=1 && [[lindex $list 0] set begin]==$begin}
}
