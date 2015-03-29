IDE::ResultBrowser proc newBrowser result {
    return [my new [Object autoname .result] [list -result $result]]
}
