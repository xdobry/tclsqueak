IDE::NSView instproc createChildNamespace ns {
    set childns [IDE::IDialogEntry getValue "Specify child namespace for $ns"]
    if {$childns eq ""} return
    set introProxy [my getIntroProxy]
    $introProxy inspectEvalNs $ns [list namespace eval $childns {}]
    set fullPath ${ns}::$childns
    my insertForParent $ns $fullPath
}
