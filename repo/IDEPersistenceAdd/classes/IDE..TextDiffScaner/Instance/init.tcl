IDE::TextDiffScaner instproc init {} {
    my instvar textWin1 textWin2
    $textWin1 tag configure hlight -background yellow
    $textWin2 tag configure hlight -background yellow
}
