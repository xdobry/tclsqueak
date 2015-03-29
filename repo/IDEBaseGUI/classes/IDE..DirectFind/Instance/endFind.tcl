IDE::DirectFind instproc endFind {} {
    my instvar win textWin
    $textWin tag remove hlight 1.0 end
    my hide
    focus $textWin
}
