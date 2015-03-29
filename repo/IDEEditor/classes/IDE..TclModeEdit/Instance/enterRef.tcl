IDE::TclModeEdit instproc enterRef tag {
    my instvar refArr
    [my info parent] setStatusBarText $refArr($tag)
}
