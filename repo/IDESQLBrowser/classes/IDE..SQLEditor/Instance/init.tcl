IDE::SQLEditor instproc init args {
   next
   set twin [my getTextWindow]
   bind $twin <KeyPress-Tab> "[self] tabPress"
   bind $twin <Control-KeyPress-space> "[self] tabPress"
}
