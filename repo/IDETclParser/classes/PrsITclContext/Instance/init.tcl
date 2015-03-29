PrsITclContext instproc init {} {
    my instvar isTclGlobalScript defaultVisibility parameters superclasses
    set defaultVisibility default
    set isTclGlobalScript 1
    set parameters [list]
    set superclasses [list ::itcl::object]
}
