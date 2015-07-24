IDE::MethodEdit instproc setTextTypeControler {text type contr} {
    my instvar win state controler oldtext
    set oldtext $text
    set controler $contr
    set state use
    my setTypedText $text $type
}
