IDE::Text instproc colorizeText {text {cur 1.0}} {
    my instvar win
    set twin $win.text
    # add variables (count)
    set cur [$twin search -count count -- $text $cur end]
    if {$cur ne ""} {
        $twin tag add hlight $cur "$cur + $count char"
        return [$twin index "$cur + $count char"]
    }
    return
}
