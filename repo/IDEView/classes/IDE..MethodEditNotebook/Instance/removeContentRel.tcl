IDE::MethodEditNotebook instproc removeContentRel view {
    my instvar viewContent
    foreach k [array names viewContent] {
        if {$viewContent($k) eq $view} {
            unset viewContent($k)
            break
        }
    }
}
