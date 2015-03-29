IDE::Text instproc tagRegExprText {tag text {cur 1.0}} {
    set twin [my getTextWindow]
    # add variables (count)
    set cur [$twin search -regexp -count count -- $text $cur end]
    if {$cur ne ""} {
        $twin tag add $tag $cur "$cur + $count char"
        return [$twin index "$cur + $count char"]
    }
    return ""
}
