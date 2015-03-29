IDE::VersionTreeView proc newBrowser result {
    return [my new [Object autoname .result] -result $result]
}
