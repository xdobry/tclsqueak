IDE::FindReplace proc bindToView tview {
    my instvar view findText firstRun
    set view $tview
    my showWindow
    set sel [$view getSelection]
    set firstRun 1
    if {$sel ne ""} {
        if {[string length $sel]>30} {
            set selectedText 1
        } else {
            set findText $sel
            set selectedText 0
        }
    } else {
        set selectedText 0
    }
}
