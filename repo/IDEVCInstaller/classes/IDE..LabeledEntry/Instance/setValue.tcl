IDE::LabeledEntry instproc setValue value {
    [self] instvar win
    $win.entry delete 0 end
    $win.entry insert 0 $value
}
