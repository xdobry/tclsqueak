IDE::ObjectBrowser instproc fillMenuStruct ms {
   $ms enablementHandler [self]
   $ms addCommand2 Destroy [list [self] destroyActual] hasObject
   $ms addCommand2 {Track Object} [list [self] trackObject] hasObject
   $ms addCommand2 {Browse Class} [list [self] browseClass] hasObject
   $ms addCommand2 {Browse Mixins} [list [self] browseMixins] hasObject
   $ms addCommand2 {Print Self} [list [self] printSelf] hasObject
   $ms addCommand2 {Print printString} [list [self] printString] hasObject
   $ms addCommand2 {Print Filters} [list [self] printFilters] hasObject
}
