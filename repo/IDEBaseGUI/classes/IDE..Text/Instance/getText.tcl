IDE::Text instproc getText {} {
    my instvar win
    set text [$win.text get 1.0 end]
    return [string range $text 0 [expr {[string length $text] - 2}]]
}
