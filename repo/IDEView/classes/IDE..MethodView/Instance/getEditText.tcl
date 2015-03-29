IDE::MethodView instproc getEditText hitem {
    lassign $hitem vclass vtype method
    set ret {}
    if {$vtype eq "Procs"} {
        if {[Object isobject $vclass]} {
            set pobj [$vclass getProcObjForNameIfExist $method]
            if {$pobj ne ""} {
                set ret [$pobj getBody]
            }
        }
    } else {
        set ret [[my getIntroProxy] getBody${vtype}MethodIfExist $vclass $method]
    }
    if {$ret eq ""} {
        return "# Method $method in $vclass was probably deleted from the System"
    }
    return $ret
}
