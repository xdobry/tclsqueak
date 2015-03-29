IDE::MethodTracker proc setObjectFilterMethod {} {
  # very ugly to define one method in another
  # there is a need for class/object extencsion in components
  Object instproc ideFilter {args} {
      ::set cproc [self calledproc]
      if {$cproc in {info instvar proc instproc set istype array}} {
          next
      } else {
         IDE::MethodTracker methodEntry [self calledclass] [self] [self calledproc] [self callingclass] [self callingobject] [self callingproc] $args
         IDE::MethodTracker methodExit [self calledclass] [self] [self calledproc] [self callingclass] [self callingobject] [self callingproc] [next]
      }
  }
}
