IDE::WikiReapMixin instproc menuInsertions ms {
   $ms addCommand {Wiki In} [list [self] wikiIn]
   next
}
