IDE proc initSystem {} {
    set core {Object Class Object::CopyHandler Class::Parameter @ ::xotcl::NoInit ::xotcl ::xotcl::rcs xotcl::Class xotcl::NoInit xotcl::Object xotcl::rcs xotcl::Class::Parameter xotcl::Object::CopyHandler __unknown xotcl::config intproc}

    set introProxy [IDE::XOIntroProxy getIntroProxy]
    foreach obj $core {
        if {[Object isobject $obj]} {
            $introProxy setMetadataForObject $obj component core
        }
    }
    if {[Object isobject ErrorReporter]} {
        ErrorReporter set version [IDE::System getVersion]
        ErrorReporter set appName TclSqueak
    }
    IDE::PlugInsManager readPlugInsList
    font create textfont {*}[IDEPreferences getParameter textfont]
    font create listboxfont {*}[IDEPreferences getParameter listboxfont]
}
