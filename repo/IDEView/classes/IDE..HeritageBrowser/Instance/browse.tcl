IDE::HeritageBrowser instproc browse {class {introProxy {}}} {
    [self]::hclassview selectFor $class $introProxy
    my setTitleAddition $class
}
