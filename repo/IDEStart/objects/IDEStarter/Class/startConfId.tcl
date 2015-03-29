IDEStarter proc startConfId id {
    my instvar sqlhandle
    my loadPreferences
    my establishDBConnection
    set scripts [lindex [$sqlhandle queryList "SELECT prescript,postscript FROM Configmap WHERE configmapid=$id"] 0]
    my set loaded 1
    namespace eval :: [lindex $scripts 0]
    namespace eval :: [my getConfigMapBodyDeep $id]
    $sqlhandle destroy
    namespace eval :: [lindex $scripts 1]
}
