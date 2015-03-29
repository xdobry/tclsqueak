IDE::Component proc loadPackage {package {version {}}} {
    my initPackageTracking
    [self]::Tracker setOn
    namespace eval :: package require $package $version
    [self]::Tracker setOff
    IDE::CommentsContainer parseAndCleanMeta
    [self]::Tracker importProc
    IDE::System signalComponentsChanged
}
