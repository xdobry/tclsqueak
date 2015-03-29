IDE::ClassViewDB instproc isSelectionPersistent {} {
    my instvar vclass
    set introProxy [my getIntroProxy]
    set desc [$introProxy getDescriptionForObject $vclass]
    expr {$desc ne "" && [$desc isPersistent]}
}
