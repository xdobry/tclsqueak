IDE::HeritageClassView instproc editSaveComment comment {
    my instvar actItem
    if {[Object isobject $actItem]} {
        $actItem setComment $comment
    }
}
