IDE::GuiClassBuilder instproc createClass {class cobj} {
    set introProxy [$cobj getIntroProxy]
    set classDef [$introProxy getClassDefinition $class {} {}]
    $introProxy handleObjDefScript $classDef
    $introProxy moveToComponent $class [$cobj getName]
    return $class
}
