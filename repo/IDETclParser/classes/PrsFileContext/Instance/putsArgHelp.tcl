PrsFileContext instproc putsArgHelp {} {
     puts "
ttclcheck options files

-h : write help and exit
-scan directory : scan recursively directory for *.tcl, *.xotcl, *.itk, *.itcl files
-w file : write signatures to file
-r file : read signatures from file and write to it at the end
-log (trace|debug|info|warn|error) : set log level
-encoding encoding : set file encoding
-l directory : use directory as repository the package signatures
-req tclpackage : same like tcl code package require name (use to register Itcl or XOTcl)
-out file : write output to file
-i file : include repository
-log loglevel : (trace,debug,info,warn,error)

-notypes : supress type checking
-oldstringop : allow usage of == operator also for strings

-html : convert all sources to html site
(only if -html present)
-od : output dir for html site
-noerror : do not incluse errors in html site
"
}
