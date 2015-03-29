IDE::SqlBrowser instproc disconnectDB {} {
   my instvar dbConnection win
   if {[info exists dbConnection] && $dbConnection ne ""} {
        $dbConnection destroy
        set dbConnection ""
        $win.run configure -state disabled
        my clearTable
   }
   catch {
        $win.connectionlab configure -text "disconnected"
        [self]::@tables setList {}
        [self]::@columns setList {}
   }
}
