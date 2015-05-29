IDE::MethodBrowser proc searchTextComponent {text component {title {}}} {
    if {$title eq ""} {
        set title $text
    }
    my showSearchResult [IDE::CodeSearch searchTextComponent $text $component]
}
