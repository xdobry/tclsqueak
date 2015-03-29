ErrorReporter instproc generateReport {} {
   my instvar win errorMsg userName
   set file [tk_getSaveFile -initialfile errorReport.xml]
   if {$file eq ""} return
   set of [open $file w]
   puts $of {<?xml version='1.0' encoding='iso-8859-1'?>
<!DOCTYPE xotclideError SYSTEM "xotclideError.dtd">
<xotclideError>}
   set name [[self class] getAppName]
   if {$name ne ""} {
       puts $of "<application>[my maskString $name]</application>"
   }
   set version [[self class] getVersion]
   if {$version ne ""} {
       puts $of "<version>[my maskString $version]</version>"
   }
   if {$userName ne ""} {
       puts $of "<user>[my maskString $userName]</user>"
   }
   set comments [$win.comment get 1.0 end]
   set comments [string range $comments 0 [expr {[string length $comments] - 2}]]
   if {$comments ne ""} {
       puts $of "<comments>[my maskString $comments]</comments>"
   }
   puts $of <errorStack>$errorMsg</errorStack>
   puts $of {</xotclideError>}
   close $of
   ::tk_messageBox -type ok -message "The error report file \"$file\" was succesfull generated. Please send it to mail@xdobry.de"
   my destroy
}
