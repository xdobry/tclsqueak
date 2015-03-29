PrsQuoted instproc changeToLiteralListIfPossible {} {
    # some people write "a b c" not {a b c} for example in foreach "a b c" $list break
    # in this case change the PrsQuoted to PrsNoSubst
    if {![my hasList]} {
        # no list so it has no substitutions
        # check if there can be a list
        set content [my prsContentString]
        if {[regexp {\s} $content]} {
            my class PrsNoSubst
        }

    }
}
