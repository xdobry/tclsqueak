IDE::NSIntroProxyInterp instproc inspectEvalNs {ns evl} {
    my instvar interp
    interp eval $interp [list namespace eval $ns $evl]
}
