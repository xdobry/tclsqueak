IDE::System proc browseString string {
    if {[Object isclass $string]} {
        IDE::HeritageBrowser newBrowser $string
    } elseif {[Object isobject $string]} {
        IDE::ObjectBrowser newBrowser $string
    } else {
       if {[my tryBrowseAsObjectList $string]} return
       if {![IDE::MethodBrowser searchImplementorsAll $string 1]} {
           IDE::Dialog message "$string is not a Class, Object (Objects list) or method name"
        }
    }
}
