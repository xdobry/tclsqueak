IDE::InstallerGUI instproc setMysqlLib args {
   my instvar usepackage libfile
   if {$usepackage} {
       IDEPreferences set preferences(mysqllib) package
   } else {
       IDEPreferences set preferences(mysqllib) $libfile
   }
}
