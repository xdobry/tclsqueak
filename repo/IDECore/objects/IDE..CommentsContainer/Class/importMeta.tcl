IDE::CommentsContainer proc importMeta meta {
    set first [lindex $meta 0]
    set second [lindex $meta 1]
    if {$first eq "Component"} {
        my importComponentMeta $meta
    } elseif {$first eq "tclproc"} {
        my importProcMeta $meta
    } elseif {$first eq "tclgroup"} {
        my importProcGroupMeta $meta
    } else {
        switch $second {
            proc {
                my importObjectMethodMeta Class $meta
            }
            instproc {
                my importObjectMethodMeta Instance $meta
            }
            default {
                my importObjectMeta $meta
            }
        }
    }
}
