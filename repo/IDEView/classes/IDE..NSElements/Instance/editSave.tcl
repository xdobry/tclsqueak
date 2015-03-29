IDE::NSElements instproc editSave value {
    my instvar vnamespace vtype vartype
    [my getIntroProxy] inspectEvalNs $vnamespace $value
}
