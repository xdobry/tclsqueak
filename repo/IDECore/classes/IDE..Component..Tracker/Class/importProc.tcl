IDE::Component::Tracker proc importProc args {
    my instvar methodsArr
    if {![info exists methodsArr]} return
    foreach method [array names methodsArr] {
        set cobj [IDE::Component getCompObjectForName $methodsArr($method)]
        set group [IDE::CommentsContainer getGroupForMethod [string trimleft $method :]]
        if {$group eq ""} {set group default}
        if {"::[namespace tail $method]" ne $method} {
            set withNamespace 1
            if {$group eq "default"} {
                set group [string trimleft [namespace qualifiers $method] :]
            }
        } else {
            set withNamespace 0
        }
        set gobj [$cobj createTclProcsGroup $group $withNamespace]
        IDE::CommentsContainer searchCommentForGroup $gobj
        $gobj getProcObjForName [string trimleft $method :]
        IDE::CommentsContainer searchCommentForMethod [string trimleft $method :]
    }
    IDE::CommentsContainer cleanTclProcComments
    unset methodsArr
}
