IDE::CBCodeController instproc setBodyText {class type method} {
    next
    my addItemToHistory [list $class $type $method]
}
