PrsOOTclContext instproc init {} {
    my instvar isTclGlobalScript parameters superclasses defCommands
    set defCommands {constructor deletemethod destructor export filter forward method mixin renamemethod self superclass unexport variable class}
    set isTclGlobalScript 1
    set parameters [list]
    set superclasses [list ::oo::object]
}
