IDE::TestCase proc getMethodCallFromObject object {
  set ret {}
  foreach method [$object info procs] {
      append ret "   $object $method [$object info args $method]\n"
  }
  return $ret
}
