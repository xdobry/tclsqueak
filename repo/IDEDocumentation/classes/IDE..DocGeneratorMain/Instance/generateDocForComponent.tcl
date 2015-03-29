IDE::DocGeneratorMain instproc generateDocForComponent component {
    my instvar outdir ignorePrivate ignoreNoCommented wikitFormater
    set cobj [IDE::Component getCompObjectForNameIfExist $component]
    if {$cobj eq ""} return
    set fname [my fileNameForComponent $cobj]
    set cg [IDE::DocGeneratorComponent new -volatile -componentObj $cobj -fileName $fname -mainObject [self] -ignorePrivate $ignorePrivate -ignoreNoCommented $ignoreNoCommented -wikitFormater $wikitFormater]
    $cg generate
    return "<li><a href=\"$fname\">$component</a>"
}
