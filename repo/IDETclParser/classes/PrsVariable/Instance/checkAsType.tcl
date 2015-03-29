PrsVariable instproc checkAsType {type context notifier} {
    set name [my getVariableName]
    if {[my isArray]} {
        set type [list array $type]
    }
    set istype [$context getVariableType $name]
    if {![$context checkVariableType $name $type]} {
            $notifier addError "expect variable '$name' as '$type' but is '$istype'" [self]
            return 0
    }
    return 1
}
