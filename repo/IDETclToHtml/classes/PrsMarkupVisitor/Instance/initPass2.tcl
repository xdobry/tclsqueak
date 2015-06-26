PrsMarkupVisitor instproc initPass2 {} {
    my instvar globalRefsArr errors errorIndex
    #unset -nocomplain globalRefsArr
    set errors [list]
    set errorIndex 1
}
