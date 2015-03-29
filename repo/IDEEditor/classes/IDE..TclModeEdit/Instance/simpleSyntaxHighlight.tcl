IDE::TclModeEdit instproc simpleSyntaxHighlight {} {
    my tagRegExprTextAll comment {(?n)^\s*[^\\]#.+$}
    set twin [my getTextWindow]
    set cur 1.0
    while 1 {
        set cur [$twin search -regexp -count count -- {[^\\]"} $cur end]
        if {$cur ne ""} {
            set qend [$twin search -regexp -- {[^\\]"} "$cur + 1 char" end]
            if {$qend ne ""} {
                set qend [$twin index "$qend + 1 char"]
                $twin tag add quoted "$cur + $count char" $qend
                set cur $qend
            } else {
                break
            }
        } else {
            break
        }
    }
}
