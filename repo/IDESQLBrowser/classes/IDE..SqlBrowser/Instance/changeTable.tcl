IDE::SqlBrowser instproc changeTable table {
   my instvar dbConnection win
   if {[$dbConnection info methods getColumns] ne ""} {
       [self]::@columns setListUnsorted [$dbConnection getColumns $table]
   }
}
