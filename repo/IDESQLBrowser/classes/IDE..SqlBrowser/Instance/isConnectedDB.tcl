IDE::SqlBrowser instproc isConnectedDB {} {
   my instvar dbConnection
   expr {[info exists dbConnection] && $dbConnection ne "" && [$dbConnection isConnected]}
}
