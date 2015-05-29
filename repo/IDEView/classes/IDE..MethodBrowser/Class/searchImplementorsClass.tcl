IDE::MethodBrowser proc searchImplementorsClass {implementor class introProxy} {
    my showSearchResult [IDE::CodeSearch searchImplementorsClass $implementor $class $introProxy]
}
