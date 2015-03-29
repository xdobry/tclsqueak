IDE::MethodDB instproc isSelectionPersistent {} {
    my instvar vclass vtype
    set introProxy [my getIntroProxy]
    set desc [$introProxy getDescriptionForObject $vclass]
    expr {$desc ne "" && [$desc isPersistent]}
}
