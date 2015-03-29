IDE::CommentsContainer proc parseAndCleanMeta {} {
    if {![@ exists metaList] || [@ set metaList] eq ""} return
    foreach meta [@ set metaList] {
        my importMeta $meta
    }
    @ set metaList {}
}
