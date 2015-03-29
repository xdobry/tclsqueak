IDE::TclKitDeployer instproc LoadHeader filename {
     my instvar origicon
     if {[file normalize $filename] == [info nameofexe]} {
        error "file in use, cannot be prefix: [file normalize $filename]"
     }
     set size [file size $filename]
     catch {
         vfs::mk4::Mount $filename hdr -readonly
         # we only look for an icon if the runtime is called *.exe (!)
         if {[string tolower [file extension $filename]] == ".exe"} {
            catch { set origicon [my readfile hdr/tclkit.ico] }
         }
      }
      catch { vfs::unmount $filename }
      return [my readfile $filename]
}
