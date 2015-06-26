Tcl2HTML instproc parseFile file {
    my instvar markups htmlOut filesOut parseMode sigOut outDir
    if {$parseMode eq "report"} {
        set markups [list]
        set htmlFile [file rootname [my getPathTruncateFile $file]].html
        set htmlOut [TclHtmlBuilder new -childof [self] $outDir $htmlFile]

        set sigFile [file rootname [my getPathTruncateFile $file]]_sig.html
        set sigOut [TclHtmlBuilder new -childof [self] $outDir $sigFile]

        $sigOut printHtmlHeader "Tcl Source (Tcl2HTML)" "<script class=\"include\" type=\"text/javascript\" src=\"[$sigOut getRootReference jquery-1.5.1.js]\"></script>"
        $sigOut puts "<h3>$file</h3>"

        $filesOut puts "<a href=\"$sigFile\" target=\"signatureFrame\" data-source=\"$htmlFile\">[my getPathTruncateFile $file]</a><br>"

        $htmlOut printHtmlHeader $file "<script class=\"include\" type=\"text/javascript\" src=\"[$htmlOut getRootReference jquery-1.5.1.js]\"></script>"
        my @markup addNavigation $htmlOut "<a href=\"[$htmlOut getRelativeReference $sigFile]\" target=\"signatureFrame\">Outline</a> "
        $htmlOut puts "<h1>[my getPathTruncateFile $file]</h1>
<pre>"

        my @markup initNewFile

        next

        $htmlOut puts {</pre>}
        my @markup generateBackReferences $htmlOut
        $htmlOut puts "<script class=\"include\" type=\"text/javascript\" src=\"[$htmlOut getRootReference tclhtml-file.js]\"></script>"

        my generateSignatures

        $sigOut puts "<script class=\"include\" type=\"text/javascript\" src=\"[$sigOut getRootReference tclhtml-sig.js]\"></script>"

        $sigOut closeAndDestroy
        $htmlOut closeAndDestroy
    } else {
        next
    }
}
