IDE::MethodEdit instproc setTextControler {text contr {type Source}} {
    my instvar win state controler oldtext
    set oldtext $text
    set controler $contr
    set state use
    if {$type eq "Source" && [$contr istype IDE::MethodView]} {
        set type xotcl
    }
    my setTypedText $text $type
}
