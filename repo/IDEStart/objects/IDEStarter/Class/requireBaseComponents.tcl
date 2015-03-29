IDEStarter proc requireBaseComponents {} {
    foreach c [my baseComponents] {
        package require $c
    }
}
