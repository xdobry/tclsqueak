IDE::EditionBrowser proc browseObjectEdition objectEdition {
    set obj [my create [Object autoname ebrowser] [Object autoname .ebrowser] -mode object]
    $obj viewObject $objectEdition
    return $obj
}
