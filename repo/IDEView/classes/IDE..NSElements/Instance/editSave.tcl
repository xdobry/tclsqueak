IDE::NSElements instproc editSave {value {contentDescr {}}} {
    my instvar vnamespace vtype vartype
    [my getIntroProxy] inspectEvalNs $vnamespace $value
}
