IDE::ObjectDescription instproc getComponent {} {
    set intoProxy [my getCompIntroProxy]
    $intoProxy getCompObjectFor [my getObjectName]
}
