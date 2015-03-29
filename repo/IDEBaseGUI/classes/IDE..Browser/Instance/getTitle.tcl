IDE::Browser instproc getTitle {} {
    return [namespace tail [my info class]]
}
