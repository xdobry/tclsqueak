IDE::HtmlGeneratorBrowser instproc changeDir {} {
   my set actualDir [IDE::Dialog getDir]
   [my set win].dir.dirname configure -text [my set actualDir]
}
