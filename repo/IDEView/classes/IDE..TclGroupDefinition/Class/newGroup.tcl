IDE::TclGroupDefinition proc newGroup view {
    return [my new [Object autoname .tgdbrowser] -classView $view]
}
