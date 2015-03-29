IDE::Text instproc tagRange {tag begin end} {
    my instvar win
    set twin $win.text
    $twin tag add $tag "1.0 + $begin char" "1.0 + $end char"
}
