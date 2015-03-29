IDE::CodeController instproc setBodyText {class type method} {
    my instvar actItem
    my set actItem [list $class $type $method]
    my refreshView
}
