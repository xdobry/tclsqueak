IDE::ComponentPersistence proc questIdForComponentName name {
    my instvar getAllwaysNewestComponent
    if {![my exists getAllwaysNewestComponent]} {
        my set getAllwaysNewestComponent 0
    }
    if {$getAllwaysNewestComponent} {
        return [[IDE::DBPersistence getPersistenceManager] queryMaxIdBase componentid Component $name]
    } else {
        if {[IDE::ComponentPersistence getVersionsForName $name] eq ""} {
            if {$name in {XOTcl Tk TclOO}} {
                package require $name
                return package
            } elseif {[IDE::Dialog yesNo "Can not find $name in the repository try to load as tcl package"] eq "yes"} {
                IDE::Component loadPackage $name
                return package
            }
        } else {
            return [IDE::VersionChooser getVersionForComponent $name]
        }
    }
}
