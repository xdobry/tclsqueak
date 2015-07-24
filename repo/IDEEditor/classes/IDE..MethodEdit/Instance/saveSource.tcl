IDE::MethodEdit instproc saveSource value {
    [my set controler] editSave $value [my getContentDescr]
    [my getTextWindow] edit modified 0
}
