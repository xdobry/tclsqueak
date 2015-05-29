IDE::MethodBrowser proc searchImplementorsComponent {implementor component} {
    my showSearchResult [IDE::CodeSearch searchImplementorsComponent $implementor $component]
}
