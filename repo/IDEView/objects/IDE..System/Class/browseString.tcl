IDE::System proc browseString string {
    if {[Object isclass $string]} {
        IDE::HeritageBrowser newBrowser $string
    } elseif {[Object isobject $string]} {
        IDE::ObjectBrowser newBrowser $string
    } else {
       if {[my tryBrowseAsObjectList $string]} return
       set result [IDE::CodeSearch search [dict create text $string type implementors scope all]]
       if {[llength [dict get $result result]]==0} {
           IDE::Dialog message "$string is not a Class, Object (Objects list) or method name"
       } else {
           IDE::MethodBrowser showSearchResult $result
       }
    }
}
