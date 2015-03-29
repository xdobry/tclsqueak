IDE::Text instproc colorizeRange {begin end} {
    my instvar win
    set twin $win.text
    $twin tag add hlight "1.0 + $begin char" "1.0 + $end char"
}
