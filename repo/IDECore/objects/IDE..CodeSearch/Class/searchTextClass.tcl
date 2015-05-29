IDE::CodeSearch proc searchTextClass {text class introProxy} {
    my search [dict create text $text type text scope object context $class introProxy $introProxy]
}
