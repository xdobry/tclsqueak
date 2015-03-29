IDE::TPersistence instproc testBAUserQuery {} {
   IDE::User getSystemUser
   IDE::User getDefault
   if {[IDE::User getDefaultUserId]!=[IDE::System getUserId]} {
        error {wrong user id}
   }
   
}
