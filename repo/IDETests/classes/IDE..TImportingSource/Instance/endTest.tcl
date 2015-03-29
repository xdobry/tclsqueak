IDE::TImportingSource instproc endTest {} {
   file delete [my getFileName]
   set cobj [IDE::Component getCompObjectForNameIfExist TestCase]
   if {$cobj ne ""} {$cobj unload}
}
