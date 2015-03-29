IDE::ComponentPersistence proc removeForEver componentName {
    set query "SELECT distinct Object.name FROM ComponentObject,Object,Component where Component.name='$componentName' and Component.componentid=ComponentObject.componentid and ComponentObject.objectid=Object.objectid"
    set objectNames [IDE::DBPersistence queryAsList $query]
    foreach objName $objectNames {
        IDE::ObjectDescription removeForEver $objName
    }
    set query "SELECT componentid FROM Component where name='$componentName'"
    set componentsId [IDE::DBPersistence queryAsList $query]
    
    set query "SELECT infoid FROM Component where name='$componentName' and infoid is not null"
    set infoid [IDE::DBPersistence queryAsList $query]
    if {[llength $infoid]>0} {
        [IDE::DBPersistence getConnection] execute "DELETE FROM Info WHERE infoid in ([join $infoid ,])"
    }
    
    [IDE::DBPersistence getConnection] execute "DELETE FROM ComponentObject WHERE componentid in ([join $componentsId ,])"
    [IDE::DBPersistence getConnection] execute "DELETE FROM Component WHERE name=\'$componentName\'"
}
