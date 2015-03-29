proc Wikit::Format::init {} {
    variable  html_frag

    vs T T   </p><p> ;vs T Q  </p><pre> ;vs T U   </p><ul><li> ;vs T O   </p><ol><li>
    vs Q T </pre><p> ;vs Q Q \n         ;vs Q U </pre><ul><li> ;vs Q O </pre><ol><li>
    vs U T  </ul><p> ;vs U Q </ul><pre> ;vs U U         \n<li> ;vs U O  </ul><ol><li>
    vs O T  </ol><p> ;vs O Q </ol><pre> ;vs O U  </ol><ul><li> ;vs O O         \n<li>
    vs I T  </dl><p> ;vs I Q </dl><pre> ;vs I U  </dl><ul><li> ;vs I O  </dl><ol><li>
    vs D T  </dl><p> ;vs D Q </dl><pre> ;vs D U  </dl><ul><li> ;vs D O  </dl><ol><li>
    vs H T       <p> ;vs H Q      <pre> ;vs H U       <ul><li> ;vs H O       <ol><li>

    vs T I   </p><dl><dt> ;vs T D   </p><dl><dd>  ;vs T H   "</p><hr size=1>"  ;vs T _   </p>
    vs Q I </pre><dl><dt> ;vs Q D </pre><dl><dd>  ;vs Q H "</pre><hr size=1>"  ;vs Q _ </pre>
    vs U I  </ul><dl><dt> ;vs U D  </ul><dl><dd>  ;vs U H  "</ul><hr size=1>"  ;vs U _  </ul>
    vs O I  </ol><dl><dt> ;vs O D  </ol><dl><dd>  ;vs O H  "</ol><hr size=1>"  ;vs O _  </ol>
    vs I I           <dt> ;vs I D           <dd>  ;vs I H  "</dl><hr size=1>"  ;vs I _  </dl>
    vs D I           <dt> ;vs D D           <dd>  ;vs D H  "</dl><hr size=1>"  ;vs D _  </dl>
    vs H I       <dl><dt> ;vs H D       <dl><dd>  ;vs H H       "<hr size=1>"  ;vs H _     {}

    array set html_frag {
	a_ {<a href="}  b0 </b>
	_a {</a>}       b1 <b>
	i_ {<img src="} i0 </i>
	tc {">}         i1 <i>
    } ; # "
}
