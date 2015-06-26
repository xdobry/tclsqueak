Tcl2HTML instproc parseFiles files {
    my instvar filesOut outDir repository
    my prepareOutDir
    my initPathTruncate $files

    set filesOut [TclHtmlBuilder new -childof [self] $outDir "files.html"]
    $filesOut printHtmlHeader {Tcl Source (Tcl2HTML)} {<script class="include" type="text/javascript" src="jquery-1.5.1.js"></script>}
    $filesOut puts "<a href=\"all.html\" target=\"signatureFrame\">All</a><br>"
    next
    $filesOut puts {<script class="include" type="text/javascript" src="tclhtml-files.js"></script>}
    $filesOut closeAndDestroy

    set allFileOut [TclHtmlBuilder new -childof [self] $outDir "all.html"]
    $allFileOut printHtmlHeader  All  {<script class="include" type="text/javascript" src="jquery-1.5.1.js"></script>}
    $allFileOut puts "<h3>All Files</h3>"
    my @markup generateIndexAll $allFileOut
    $allFileOut puts {<script class="include" type="text/javascript" src="tclhtml-sig.js"></script>}
    $allFileOut closeAndDestroy

    set fontFileOut [TclHtmlBuilder new -childof [self] $outDir "front.html"]
    $fontFileOut printHtmlHeader  "Files Overview"
    my @markup generateFrontFile $fontFileOut
    $fontFileOut closeAndDestroy

    set indexAllOut [TclHtmlBuilder new -childof [self] $outDir "index-all.html"]
    $indexAllOut printHtmlHeader "Index All"
    my @markup generateABCIndex $indexAllOut
    $indexAllOut closeAndDestroy

    set classTreeOut [TclHtmlBuilder new -childof [self] $outDir "classes.html"]
    $classTreeOut printHtmlHeader "Classes Tree"
    my @markup generateClassHierarchy $classTreeOut $repository
    $classTreeOut closeAndDestroy

    set packagesOut [TclHtmlBuilder new -childof [self] $outDir "packages.html"]
    $packagesOut printHtmlHeader "Packages"
    my @markup generatePackages $packagesOut
    $packagesOut closeAndDestroy

    set errorsOut [TclHtmlBuilder new -childof [self] $outDir "errors.html"]
    $errorsOut printHtmlHeader "Errors"
    my @markup generateErrors $errorsOut
    $errorsOut closeAndDestroy

}
