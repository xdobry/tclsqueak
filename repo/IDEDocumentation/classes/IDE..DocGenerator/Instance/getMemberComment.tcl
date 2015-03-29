IDE::DocGenerator instproc getMemberComment {member arguments comment} {
    append text {<div class="memitem">}
    append text "\n<div class=\"memproto\"><span class=\"memname\">$member</span> $arguments</div>\n"
    append text [my getCommentClass $comment memcomment]
    append text "</div>\n"
    return $text
}
