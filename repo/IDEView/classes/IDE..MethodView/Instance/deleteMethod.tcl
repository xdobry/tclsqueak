IDE::MethodView instproc deleteMethod method {
    my instvar vtype vclass
    set introProxy [my getIntroProxy]
    $introProxy deleteMethodForObject $vclass $method $vtype
    my selectItem {}
    my removeItem $method
}
