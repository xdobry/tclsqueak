IDE::DialogHelper instproc unGrab {} {
    my instvar oldGrab grabStatus win
    grab release $win
    if {$oldGrab ne "" && [winfo exists $oldGrab] && [winfo ismapped $oldGrab]} {
        if {$grabStatus eq "global"} {
            catch {::grab -global $oldGrab}
        } else {
            catch {::grab $oldGrab}
        }
        set oldGrab ""
    }
}
