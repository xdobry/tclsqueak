IDE::ProgEdit instproc tabShiftPress {} {
    lassign [my getSelectedLines] sStart sEnd
    if {$sStart<$sEnd} {
        my minusIndent
        return 1
    }
    return 0
}
