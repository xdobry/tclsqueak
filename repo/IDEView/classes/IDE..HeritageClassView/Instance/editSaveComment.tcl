IDE::HeritageClassView instproc editSaveComment {comment {contentDesc {}}} {
    my instvar actItem
    if {[Object isobject $actItem]} {
        $actItem setComment $comment
    }
}
