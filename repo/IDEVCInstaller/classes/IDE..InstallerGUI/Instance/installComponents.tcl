IDE::InstallerGUI instproc installComponents args {
    [self] instvar copyComponents saveParams connection
    if {$copyComponents} {
      set compToInstall [concat [IDE::System getCoreComponents] [IDE::System getExtraComponents]]
      IDE::DBPersistence initSchema
      IDE::User initDefault
      foreach p $compToInstall {
        [self]::status setMessage "loading $p"
        package require $p
      }
      [self]::status setMessage "computing components"
      IDE::Component initFromInterpreter
      IDE::CommentsContainer parseAndCleanMeta
      IDE::CommentsContainer makeTclGroupsFromMeta
      $connection openUnitOfWork
      foreach p $compToInstall {
          update idletasks
          [self]::status setMessage "installing $p"
          IDE::ComponentPersistence importComponent $p
          set cobj [IDE::Component getCompObjectForName $p]
          foreach obj [concat [$cobj getObjects] [$cobj getClasses] [$cobj getProcsGroupsObjects]] {
             set desc [$obj getDescription]
             $desc versionEdition
          }
          $cobj versionEdition
      }
      $connection closeUnitOfWork
    }
    if {$saveParams} {
        IDEPreferences savePreferences
    }
    return 1
}
