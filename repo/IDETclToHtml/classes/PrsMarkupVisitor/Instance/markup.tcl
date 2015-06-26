PrsMarkupVisitor instproc markup {elem type} {
    my instvar markups
    lappend markups [list [$elem set begin] [$elem set end] $type]
}
