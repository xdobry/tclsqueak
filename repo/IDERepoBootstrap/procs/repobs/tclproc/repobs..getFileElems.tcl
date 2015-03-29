proc repobs::getFileElems {repo path {pattern *.tcl}} {
    getElemsForType $repo $path f $pattern
}
