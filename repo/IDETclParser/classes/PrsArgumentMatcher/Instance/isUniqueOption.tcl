PrsArgumentMatcher instproc isUniqueOption {searchOption fullOption options} {
    set olen [string length $searchOption]
    if {[string index $searchOption 0] eq "-" && $olen>1 && [string range $fullOption 0 $olen-1] eq $searchOption} {
        foreach o $options {
            if {$fullOption ne $o && [string range $o 0 $olen] eq $searchOption} {
                # not unique
                return 0
            }
        }
        return 1
    }
    return 0
}
