IDE::System proc getCoreComponentsAll {} {
  return [concat [my getCoreComponents] core default]
}
