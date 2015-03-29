POTHelper instproc fillMenuStruct ms {
    $ms enablementHandler [self]
    $ms addCommand {Generate Message Catalog} [list [self] saveMsg]
    $ms addCommand {Generate XLIFF Catalog} [list [self] generateXLIFF 0]
    $ms addCommand {Generate XLIFF Template} [list [self] generateXLIFF]
    $ms addCommand {Generate HTML Template} [list [self] generateHTML]
    $ms addCommand {Convert XLIFF to Message Catalog} [list [self] convertXLIFFtoMsg]
    $ms addCommand {Reset Catalog} [list [self] resetCatalog]
    $ms addSeparator
    $ms addCommand {Next Empty} [list [self] nextEmptyItem] {} Control-n
    $ms addCommand {Previous Empty} [list [self] prevEmptyItem] {} Control-p
}
