IDE::MethodEdit instproc setCommentSourceItemControler {comment source tvclass tvtype tmethod controler} {
    my instvar vclass vctype method
    set vclass $tvclass
    set vctype $tvtype
    set method $tmethod
    my setCommentSourceControler $comment $source $controler
}
