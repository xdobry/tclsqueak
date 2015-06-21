PrsVariable instproc checkSyntax {context notifier} {
    set name [my getVariableName]
    if {![$context checkVariable $name]} {
        $notifier addError "unknown variable $name" [self]
    } else {
        set isArray [my isArray]
        set type [lindex [$context getVariableType $name] 0]
        if {$type ni {def unknown}} {
            if {$isArray && $type ne "array"} {
                $notifier addError "variable is scalar $type but is used as array" [self]
            } elseif {!$isArray && $type eq "array"} {
                $notifier addError "variable is array but is used as scalar" [self]
            }
        }
    }
}
