IDE::VarsTracker instproc addVariable {var options changedoption} {
    my instvar varList
    set index [lsearch -exact $varList $var]
    if {$index!=-1} {
        [self]::varlist removeItemAt $index
        [self]::varlist addItemAt "$var ($options)" $index
    } else {
        lappend varList $var
        [self]::varlist addItemAtTail "$var ($options)"
    }
    if {$changedoption eq "watch"} {
        my addWatchOn $var
    }
}
