IDE::ChangesBrowser instproc nextDifference {} {
    my instvar compare
    if {$compare} {
        [self]::comparer markNextDiff 
    }
}
