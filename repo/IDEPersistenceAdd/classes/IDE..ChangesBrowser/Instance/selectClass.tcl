IDE::ChangesBrowser instproc selectClass class {
    my instvar comp1 comp2 compArr1 compArr2 vtype methArr1 methArr2 vclass
    set vclass $class
    catch {unset methArr1 methArr2}
    if {[info exists compArr1($class)]} {
        [$comp1 getObject $class] set${vtype}MethodsArray methArr1
    }
    if {[info exists compArr2($class)]} {
        [$comp2 getObject $class] set${vtype}MethodsArray methArr2
    }
    set diffMethods [my getDiffFromArrays methArr1 methArr2]
    [self]::methods setList $diffMethods
}
