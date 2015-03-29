IDE::EditionBrowser proc browseComponentEdition compEdition {
    set obj [my create [Object autoname ebrowser] [Object autoname .ebrowser] -mode component]
    $obj viewComponent $compEdition
    return $obj
}
