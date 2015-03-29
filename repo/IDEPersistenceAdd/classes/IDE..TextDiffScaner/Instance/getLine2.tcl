IDE::TextDiffScaner instproc getLine2 line {
    my instvar textWin2
    return [$textWin2 get $line.0 [list $line.0 lineend]]
}
