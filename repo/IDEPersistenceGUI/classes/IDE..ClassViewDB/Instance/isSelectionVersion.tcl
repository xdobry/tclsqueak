IDE::ClassViewDB instproc isSelectionVersion {} {
    my instvar vclass
    set introProxy [my getIntroProxy]
    expr {[[$introProxy getDescriptionForObject [my set vclass]] isclosed]}
}
