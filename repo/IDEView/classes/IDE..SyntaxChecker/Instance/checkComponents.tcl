IDE::SyntaxChecker instproc checkComponents {} {
    my instvar errorsArr
    set components [[self]::components selectedItem]
    if {$components eq ""} {
        IDE::Dialog message "No components selected"
        return
    }
    catch {unset errorsArr}
    [self]::messages setList {}
    set c 0
    set report [time {
        foreach component $components {
            set cobj [IDE::Component getCompObjectForNameIfExist $component]
            set introProxy [$cobj getIntroProxy]
            set prefix [$introProxy getMethodTypePrefix]
            foreach cls [$cobj getClasses] {
                foreach method [$introProxy getInstanceMethods $cls] {
                    set chk [PrsContext new]
                    $chk parseAndCheck [$introProxy getBodyInstanceMethod $cls $method]
                    my setStateText "$cls [incr c]"
                    if {[$chk hasErrors]} {
                        set methoddisplay "$cls $prefix>$method"
                        set errorsArr($methoddisplay) [$chk errors]
                    }
                    $chk destroy
                    update
                }
                foreach method [$introProxy getClassMethods $cls] {
                    set chk [PrsContext new]
                    $chk parseAndCheck [$introProxy getBodyClassMethod $cls $method]
                    my setStateText "$cls [incr c]"
                    if {[$chk hasErrors]} {
                        set methoddisplay "$cls ${prefix}class>$method"
                        set errorsArr($methoddisplay) [$chk errors]
                    }
                    $chk destroy
                    update
                }
            }
            foreach obj [$cobj getObjects] {
                foreach method [$introProxy getClassMethods $obj] {
                    if {$method eq "-"} continue
                    set chk [PrsContext new]
                    $chk parseAndCheck [$introProxy getBodyClassMethod $obj $method]
                    my setStateText "$obj [incr c]"
                    if {[$chk hasErrors]} {
                        set errorsArr($obj\ class>$method) [$chk errors]
                    }
                    $chk destroy
                    update
                }
            }
            foreach gobj [$cobj getProcsGroupsObjects] {
                foreach method [$gobj getProcsNames] {
                    set chk [PrsContext new]
                    $chk parseAndCheck [$introProxy getProcBody $method]
                    my setStateText "procs [incr c]"
                    if {[$chk hasErrors]} {
                        set errorsArr(proc\ $method) [$chk errors]
                    }
                    $chk destroy
                    update
                }
            }
        }
    }]
    my setStateText "$report $c methods"
    my setListViews
}
