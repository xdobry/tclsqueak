PrsMarkupVisitor instproc collectErrors {} {
    my instvar context markups errors fileName errorIndex
    foreach err [$context set errors] {
        lassign $err begin end message
        lappend markups [list $begin $end error $message $errorIndex]
        lappend errors [list $fileName $message]
        incr errorIndex
    }
}
