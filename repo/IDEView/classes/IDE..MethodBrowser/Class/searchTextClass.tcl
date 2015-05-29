IDE::MethodBrowser proc searchTextClass {text class title introProxy} {
    if {$title eq ""} {
        set title $text
    }
    my showSearchResult [IDE::CodeSearch searchTextClass $text $class $introProxy]
}
