IDE::Text instproc tagRegExprTextAll {tag text} {
    set index 1.0
    while 1 {
        set index [my tagRegExprText $tag $text $index]
        if {$index eq ""} break
    }
}
