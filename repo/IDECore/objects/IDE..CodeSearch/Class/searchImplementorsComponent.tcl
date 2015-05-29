IDE::CodeSearch proc searchImplementorsComponent {implementor component} {
    my search [dict create text $implementor type implementors scope component context $component]
}
