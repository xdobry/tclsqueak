IDE::DocGenerator instproc generate {} {
   my instvar outdir fileName
   set mf [open [file join [my getOutDir] $fileName] w]
   fconfigure $mf -encoding utf-8
   puts $mf [subst -nobackslashes [my pageContent]]
   close $mf
}
