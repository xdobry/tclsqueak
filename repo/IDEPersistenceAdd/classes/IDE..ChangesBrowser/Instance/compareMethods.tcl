IDE::ChangesBrowser instproc compareMethods {m1 m2} {
    # m1 and m1 are methods text
    my instvar compare
    my setTextLeft $m1
    my setTextRight $m2
    [self]::comparer scane
    set compare 1
    my nextDifference
}
