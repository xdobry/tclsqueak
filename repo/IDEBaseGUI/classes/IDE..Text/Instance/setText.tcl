IDE::Text instproc setText text {
    my instvar win state
    my makeEmpty
    $win.text insert 1.0 $text
    set state notempty
    $win.text edit reset
    $win.text edit modified 0
}
