IDE::MethodView instproc newInitializeAfterLoad {} {
    my instvar vclass
    [my info parent]::methodedit setTextControler "$vclass proc initializeAfterLoad {} {\n    # init your class varibales and other stuff\n}" [self]
    [my info parent]::methodedit setSelection "2.4" "2.4 lineend"
    my prepareNewMethodState
}
