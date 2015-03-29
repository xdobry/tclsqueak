IDE::ObjectDescription proc importObject object {
    set od [my createForObject $object]
    $od set versioninfo {[import] 1.0}
    $od set userid [IDE::System getUserId]
    $od set isclosed 0
    $od insertVersion
    $od importAllMethods
    set comment [IDE::CommentsContainer objectGetComment $object]
    $od trackingOn
    if {$comment ne ""} {
        set introProxy [$od getCompIntroProxy]
        $introProxy setCommentForObject $object $comment
    }
    IDE::CommentsContainer destroyObject ::$object
    return $od
}
