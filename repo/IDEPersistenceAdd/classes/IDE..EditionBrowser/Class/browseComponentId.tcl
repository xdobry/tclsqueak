IDE::EditionBrowser proc browseComponentId compId {
    set edition [IDE::ComponentEdition new $compId]
    my browseComponentEdition $edition
}
