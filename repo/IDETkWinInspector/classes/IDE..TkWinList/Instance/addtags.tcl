IDE::TkWinList instproc addtags {w tags} {
    foreach {d tag pos} $tags {
        if {$d == "tagon"} {
            set t($tag) $pos
        } elseif {$d == "tagoff" && [info exists t($tag)] && $t($tag) != ""} {
            $w tag add $tag $t($tag) $pos
            unset t($tag)
        }
    }
 }
