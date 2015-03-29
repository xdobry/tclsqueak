IDE::ObjectDescription proc getClassForType type {
    if {$type eq "Class"} {
        return IDE::ClassDesciption 
    } elseif {$type eq "Object"} {
        return IDE::ObjectDesciption
    } elseif {$type eq "ProcsGroup"} {
        return IDE::ProcsGroup
    } else {
        error {unknown type}
    }
}
