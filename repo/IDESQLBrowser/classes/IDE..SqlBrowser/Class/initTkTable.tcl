IDE::SqlBrowser proc initTkTable {} {
    if {[info commands table] eq ""} {
        if {[catch {package require Tktable}]} {
            return 0
        }
    }
    if {[Object isobject IDE::Component] && [IDE::Component getCompObjectForNameIfExist xdobry::sql] eq ""} {
        IDEStarter loadComponentFromAny xdobry::sql
    } else {
        package require xdobry::sql
    }
    return 1
}
