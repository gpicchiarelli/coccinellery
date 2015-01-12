@r exists@
local idexpression x;
expression E,E1;
position p1,p2,p3;
statement S;
@@

x@p1 = \(of_find_node_by_path\|of_find_node_by_name\|of_find_node_by_phandle\|of_get_parent\|of_get_next_parent\|of_get_next_child\|of_find_compatible_node\|of_match_node\)(...);
...
if (x == NULL) S
<... when != x = E
if@p2 (...) {
  ... when != of_node_put(x)
      when != if (...) { ... of_node_put(x); ... }
(
  return <+...x...+>;
|
  return@p3 ...;
)
}
...>
of_node_put(x);

@script:python@
p1 << r.p1;
p2 << r.p2;
p3 << r.p3;
@@

cocci.print_main("call",p1)
cocci.print_secs("if",p2)
cocci.print_secs("return",p3)