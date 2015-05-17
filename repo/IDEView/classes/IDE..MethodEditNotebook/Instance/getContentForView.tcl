IDE::MethodEditNotebook instproc getContentForView view {
    my instvar viewContent
    foreach k [array names viewContent] {
        if {$viewContent($k) eq $view} {
            return $k
        }
    }
    return
}
