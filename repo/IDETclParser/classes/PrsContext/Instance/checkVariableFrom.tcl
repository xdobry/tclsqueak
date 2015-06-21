PrsContext instproc checkVariableFrom {prsObject notifier {type unknown}} {
    $prsObject parseAsVariableRef
    if {[$prsObject hasclass PrsVariableRef]} {
        set name [$prsObject getVariableName]
        if {$name eq "v11"} {
            my halt
        }
        if {![my checkVariable $name $type]} {
            $notifier addError "unknown variable '$name'" $prsObject
        }
        $prsObject setType [my getVariableType $name]
    }
}
