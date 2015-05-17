IDE::CompBrowser instproc setBodyText {class type method} {
    my @codecontroller viewContent [list $class $type $method] search
}
