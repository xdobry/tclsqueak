IDE::TArgumentMatcher instproc init args {
    my instvar errors context stream parser argMatcher
    set errors [list]
    set context [PrsContext new -childof [self]]
    set obj [ReadStringStream new -childof [self] -string ""]
    set parser [TclParser new -childof [self] -stream $obj]
    set argMatcher [PrsArgumentMatcher new -childof [self] -context $context]
    next
}
