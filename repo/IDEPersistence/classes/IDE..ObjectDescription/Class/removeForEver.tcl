IDE::ObjectDescription proc removeForEver objectName {
    set query "SELECT objectid FROM Object where name='$objectName'"
    set objectsId [IDE::DBPersistence queryAsList $query]
    set query "SELECT infoid FROM Object where name='$objectName' and infoid is not null"
    set infoid [IDE::DBPersistence queryAsList $query]
    set query "SELECT infoid FROM Method where objectname='$objectName' and infoid is not null"
    set infoid [concat $infoid [IDE::DBPersistence queryAsList $query]]
    if {[llength $infoid]>0} {
        [IDE::DBPersistence getConnection] execute "DELETE FROM Info WHERE infoid in ([join $infoid ,])"
    }
    [IDE::DBPersistence getConnection] execute "DELETE FROM ObjectMethod WHERE objectid in ([join $objectsId ,])"
    [IDE::DBPersistence getConnection] execute "DELETE FROM Method WHERE objectname=\'$objectName\'"
    [IDE::DBPersistence getConnection] execute "DELETE FROM Object WHERE name='$objectName'"
}
