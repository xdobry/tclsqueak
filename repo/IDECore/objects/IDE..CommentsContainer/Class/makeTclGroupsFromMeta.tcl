IDE::CommentsContainer proc makeTclGroupsFromMeta {} {
    my instvar proc_method
    IDE::ProcsGroup buildStuctFromArray proc_method
    foreach gobj [IDE::ProcsGroup info instances] {
        IDE::CommentsContainer searchCommentForGroup $gobj
    }
    foreach mobj [IDE::TclProcsDescription info instances] {
        IDE::CommentsContainer searchCommentForMethod $mobj
    }
    my cleanTclProcComments
}
