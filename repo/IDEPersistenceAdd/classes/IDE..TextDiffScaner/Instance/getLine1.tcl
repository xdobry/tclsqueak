IDE::TextDiffScaner instproc getLine1 line {
    my instvar textWin1
    return [$textWin1 get $line.0 [list $line.0 lineend]]
}
