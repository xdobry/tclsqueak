PrsContext instproc checkVariableFrom {prsObject notifier {type unknown}} {
    $prsObject parseAsVariableRef
    if {[$prsObject hasclass PrsVariableRef]} {
        set name [$prsObject getVariableName]
        if {![my checkVariable $name $type]} {
            $notifier addError "unknown variable '$name'" $prsObject
        }
        $prsObject setType [my getVariableType $name]
    }
}
