IDE::TclModeEdit instproc setCommentSourceControler {comment source contr} {
    my instvar win state controler oldtext oldcommment hasErrors noModifyEvents
    set hasErrors 0
    set oldtext $source
    set oldcommment $comment
    set controler $contr
    set state use
    
    my setType xotcl

    set noModifyEvents 1
    $win.text edit reset
    my makeEmpty
    
    set twin [my getTextWindow]
    if {$comment ne ""} {
        $twin insert 1.0 $comment comment
    }
    $twin insert end $source
    set state notempty
    my syntaxHighlightIfWanted
    $win.text edit modified 0
    set noModifyEvents 0
}
