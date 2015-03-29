IDE::CommentsContainer proc objectHasComment object {
    my instvar objComments
    return [expr {[info exists objComments($object)] && $objComments($object) ne ""}]
}
