IDE::ChangesBrowser instproc changeViewType vt {
    my instvar vtype vclass mode methArr1 methArr2 obj1 obj2
    set vtype $vt
    if {$mode eq "components"} {
        if {[::info exists vclass]} {
            # if no diference is found vclass is unset
            my selectClass $vclass
        }
    } elseif {$mode eq "objects"} {
        catch {unset methArr1 methArr2}
        $obj1 set${vtype}MethodsArray methArr1
        $obj2 set${vtype}MethodsArray methArr2
        set diffMethods [my getDiffFromArrays methArr1 methArr2]
        [self]::methods setList $diffMethods
    }
}
