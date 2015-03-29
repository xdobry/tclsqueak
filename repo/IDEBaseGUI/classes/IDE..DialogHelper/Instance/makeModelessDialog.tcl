IDE::DialogHelper instproc makeModelessDialog {} {
    my instvar oldFocus oldGrab win grabStatus
    if {![my exists result]} {
        my set result {}
    }
    set oldFocus [focus]
    set oldGrab [::grab current $win]
    if {$oldGrab ne ""} {
        set grabStatus [::grab status $oldGrab]
    }
    # it can fail
    catch {::grab $win}
    focus $win
}
