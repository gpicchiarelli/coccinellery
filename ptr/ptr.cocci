//
//  Correct error handling code
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression E,E1;
@@

if (
-   E == NULL
+   IS_ERR(E)
   ) { <+... when != E = E1
        PTR_ERR(E)
       ...+> }
