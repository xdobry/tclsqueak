IDE::ChangesBrowser proc compareMethods {meth1 meth2} {
    set obj [my create [Object autoname browser] [Object autoname .browser] -mode methods]
    $obj compareMethods $meth1 $meth2
    return $obj
}
