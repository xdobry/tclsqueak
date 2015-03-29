IDE::TclKitDeployer instproc writefile {name data} {
  set fd [open $name w]
  fconfigure $fd -translation binary
  puts -nonewline $fd $data
  close $fd
}
