IDE::CodeSearch proc searchImplementorsClass {implementor class introProxy} {
    my search [dict create text $implementor type implementors scope object context $class introProxy $introProxy]
}
