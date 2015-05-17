IDE::MethodListView instproc selectClassTypeMethod {class type method} {
    my instvar introProxy
    set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $type]
    [my info parent] setBodyText $class $type $method
}
