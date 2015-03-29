IDE::RegexpBrowser instproc replace:toggle {} {
    my instvar data v_mode

    if {$v_mode eq "replace"} {
        bind $data(w:regexp) <Tab> "focus $data(w:replace); break;"
        bind $data(w:regexp) <Shift-Tab> "focus $data(w:sample); break;"
        catch { bind $data(w:regexp) <ISO_Left_Tab> "focus $data(w:sample); break;" }

        bind $data(w:replace) <Tab> "focus $data(w:sample); break;"
        bind $data(w:replace) <Shift-Tab> "focus $data(w:regexp); break;"
        catch { bind $data(w:replace) <ISO_Left_Tab> "focus $data(w:regexp); break;" }

        bind $data(w:sample) <Tab> "focus $data(w:regexp); break;"
        bind $data(w:sample) <Shift-Tab> "focus $data(w:replace); break;"
        catch { bind $data(w:sample) <ISO_Left_Tab> "focus $data(w:replace); break;" }

        pack $data(w:allreplace) -side top -fill both

    } else {
        bind $data(w:regexp) <Tab> "focus $data(w:sample); break;"
        catch { bind $data(w:regexp) <ISO_Left_Tab> "focus $data(w:sample); break;" }

        bind $data(w:sample) <Tab> "focus $data(w:regexp); break;"
        catch { bind $data(w:sample) <ISO_Left_Tab> "focus $data(w:regexp); break;" }

        pack forget $data(w:allreplace)
    }
}
