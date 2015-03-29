IDE::VarsTracker instproc removeVariable {var options changedoption} {
    my instvar varList
    set index [lsearch -exact $varList $var]
    if {$index!=-1} {
        if {[llength $options]==0} {
            [self]::varlist removeItemAt $index
            set varList [lreplace $varList $index $index]
        } else {
            [self]::varlist removeItemAt $index
            [self]::varlist addItemAt "$var ($options)" $index
        }
    }
    if {$changedoption eq "watch"} {
        my removeWatchOn $var
    }
    [self]::varlist unselect
}
