IDE::ChangesBrowser instproc getChangesScript {comp1 comp2} {
    set ret "#changes for component [$comp1 getName]\n# !!! Warning\n# The result are not full reliable\n#the moved classes and changes in class definition are not computed exactly\n"
    $comp1 setObjectsArray compArr1
    $comp2 setObjectsArray compArr2
    set classdiffs [my getDiffFromArrays compArr1 compArr2]
    foreach class $classdiffs {
        if {![info exists compArr1($class)]} {
            append ret "# Class $class was removed or moved\n"
            append ret "# $class destroy\n"
            continue
        }
        set obj1 [$comp1 getObject $class]
        set obj2 [$comp2 getObject $class]
        if {![info exists compArr2($class)]} {
            append ret "# Class $class was created or moved\n"
            append ret "if {\[Object isobject $class\]} { IDE::Dialog message \"check class $class. probably moved to [$comp1 getName]\"} else \{\n"
            append ret "[$obj1 getDefBody]\n"
            append ret "[$obj1 getName] moveToComponent [$comp1 getName]\n"
            foreach vtype {Class Instance} {
                catch {unset methArr1}
                $obj1 set${vtype}MethodsArray methArr1
                if {![array exists methArr1]} continue
                foreach method [array names methArr1] {
                    append ret [$obj1 get${vtype}MethodBody $method] \n
                }
            }
            append ret "\}\n"
            catch {unset methArr1}
            continue
        }
        append ret [my getChangesScriptForObjects [$comp1 getName] $class $obj1 $obj2]
    }
    return $ret
}
