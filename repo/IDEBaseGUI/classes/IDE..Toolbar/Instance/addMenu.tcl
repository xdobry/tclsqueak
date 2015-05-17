IDE::Toolbar instproc addMenu {menu image {pos 1.0}} {
   my addCommand [$menu name] [$menu command] $image $pos
}
