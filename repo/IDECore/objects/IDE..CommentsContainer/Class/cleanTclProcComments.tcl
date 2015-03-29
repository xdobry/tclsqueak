IDE::CommentsContainer proc cleanTclProcComments {} {
    if {[my exists proc_groupcomment]} {[self] unset proc_groupcomment}
    if {[my exists proc_method]} {[self] unset proc_method}
    if {[my exists proc_comment]} {[self] unset proc_comment}
}
