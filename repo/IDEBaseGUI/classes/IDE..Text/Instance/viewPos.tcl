IDE::Text instproc viewPos pos {
    my instvar win
    set twin $win.text
    $twin see "1.0 + $pos char"
}
