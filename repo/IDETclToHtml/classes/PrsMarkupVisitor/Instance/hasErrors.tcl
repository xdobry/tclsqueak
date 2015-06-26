PrsMarkupVisitor instproc hasErrors {} {
    my instvar errors
    expr {[llength $errors]>0}
}
