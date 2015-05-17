IDE::CompView instproc refreshView {} {
    my instvar vcomponent
    [my info parent] @codecontroller viewContent [list $vcomponent Component {}] navigation
}
