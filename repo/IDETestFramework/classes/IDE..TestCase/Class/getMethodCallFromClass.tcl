IDE::TestCase proc getMethodCallFromClass class {
  set ret {}
  foreach method [$class info instprocs] {
      append ret "   \$obj $method [$class info instargs $method]\n"
  }
  return $ret
}
