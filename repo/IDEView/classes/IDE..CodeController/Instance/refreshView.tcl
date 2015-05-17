IDE::CodeController instproc refreshView {} {
    my instvar actItem
    lassign $actItem class type method
    my setBodyTextControler $class $type $method [self]
}
