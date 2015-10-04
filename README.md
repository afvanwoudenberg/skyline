Skyline
=======

This is a Prolog program for solving the Skyline puzzle. Skyline was designed by Jean Claude Constantin, a puzzle designer based in Germany.

To use this program open the file skyline.pl in your favorite Prolog interpreter (e.g. SWI-Prolog) and execute the following:

    ?- print_solution(pos(4,4)).
    +-------+
    |ggeeeeh|
    |gggdehh|
    |ggiddhh|
    |iii ddh|
    |iiicfff|
    |bicccff|
    |baaaaaf|
    +-------+
    true

You can press ; to find alternative solutions. The pos(X,Y) part refers to the location of the metal rod.

