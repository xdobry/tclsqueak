IDE::RepositoryImporter proc newBrowser {} {
     if {![Object isobject IDE::ConfigurationMap]} {
         IDE::Dialog message "Load ConfigurationMap Browser first"
         return
     }
     return [my new [Object autoname .repimporter]]
}
