IDE::CompView instproc editSaveComment {comment {contentDesc {}}} {
    my instvar vcomponent
    set cobj [IDE::Component getCompObjectForNameIfExist $vcomponent]
    if {$cobj ne ""} {
        $cobj setComment $comment
    }
}
