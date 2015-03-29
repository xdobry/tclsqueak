PrsQuoted instproc getLiteralAfterVariable {} {
    # something like $a.re ".re" is literal
    my instvar list end
    if {[my isVariablePlusLiteral]} {
        return [[[my getParser] stream] copyFromTo [expr {[[lindex $list 0] set end]+1}] [my end]]
    }
    return
}
