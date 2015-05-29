IDE::CodeSearch proc searchTextComponent {text component} {
    my search [dict create text $text type text scope component context $component]
}
