IDE::TclKitDeployer instproc decICO dat {
  set result {}
  binary scan $dat sss - type count
  for {set pos 6} {[incr count -1] >= 0} {incr pos 16} {
    binary scan $dat @${pos}ccccssii w h cc - p bc bir io
    if {$cc == 0} { set cc 256 }
    #puts "pos $pos w $w h $h cc $cc p $p bc $bc bir $bir io $io"
    binary scan $dat @${io}a$bir image
    lappend result ${w}x${h}/$cc $image
  }
  return $result
}
