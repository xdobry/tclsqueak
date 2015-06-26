PrsMarkupVisitor instproc fileToRelativeHtmlFile {out fileName} {
    return [file rootname [$out getRelativeReference $fileName]].html
}
