IDE::System proc inspectString res {
    if {$res eq ""} {
         IDE::Dialog message "No result"
    } elseif {[Object isobject $res]} {
        $res inspect
    } else {
       if {[my tryBrowseAsObjectList $res]} return
       my handleResult $res
    }
}
