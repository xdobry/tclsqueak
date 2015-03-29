IDE::MethodBrowser proc newBrowserList {list title} {
    set inst [my newBrowser]
    $inst setMethodList $list
    $inst setTitleAddition $title
    return $inst
}
