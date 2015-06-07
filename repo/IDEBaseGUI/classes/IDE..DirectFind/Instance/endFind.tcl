IDE::DirectFind instproc endFind {} {
    my instvar win textWin
    if {[winfo exists $textWin]} {
        $textWin tag remove hlight 1.0 end
        focus $textWin
    }
    my hide
}
