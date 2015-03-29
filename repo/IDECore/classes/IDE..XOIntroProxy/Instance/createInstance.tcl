IDE::XOIntroProxy instproc createInstance {class name params} {
    namespace eval :: [list $class create $name {*}$params]
}
