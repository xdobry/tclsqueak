IDE::System proc versionAllCoreComponents {{versionInfo {}}} {
   foreach cname [concat [my getExtraComponents] [my getCoreComponents]] {
        set cobj [IDE::Component getCompObjectForNameIfExist $cname]
        if {$cobj ne "" && [$cobj isPersistent] && ![$cobj isclosed]} {
            if {$versionInfo ne ""} {
               $cobj setVersionInfo $versionInfo
            }
            $cobj versionEdition
        }
   }
}
