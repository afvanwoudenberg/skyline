% skyline.pl
% Aswin van Woudenberg

print_solution(Pos) :- solve(Pos,Sol), print_board(Sol).

pos(X,Y) :- member(X,[1,2,3,4,5,6,7]), member(Y,[1,2,3,4,5,6,7]).

board(Board) :- findall(pos(X,Y),pos(X,Y),Board).

solve(pos(X,Y),[piece(a,A),piece(b,B),piece(c,C),piece(d,D),piece(e,E),piece(f,F),piece(g,G),piece(h,H),piece(i,I)]) :- 
    board(Board), ord_subtract(Board,[pos(X,Y)],Board1),
    piece(i,I), ord_subset(I,Board1), ord_subtract(Board1,I,Board2),
    piece(g,G), ord_subset(G,Board2), ord_subtract(Board2,G,Board3),
    piece(h,H), ord_subset(H,Board3), ord_subtract(Board3,H,Board4),
    piece(f,F), ord_subset(F,Board4), ord_subtract(Board4,F,Board5),
    piece(e,E), ord_subset(E,Board5), ord_subtract(Board5,E,Board6),
    piece(d,D), ord_subset(D,Board6), ord_subtract(Board6,D,Board7),
    piece(a,A), ord_subset(A,Board7), ord_subtract(Board7,A,Board8),
    piece(c,C), ord_subset(C,Board8), ord_subtract(Board8,C,B),
    piece(b,B).

print_board(Pieces) :- 
    write('+-------+'), nl,
    findall(_,(member(Y,[1,2,3,4,5,6,7]),print_line(Y,Pieces)),_),
    write('+-------+'), nl.

print_line(Y,Pieces) :- write('|'),findall(_,(member(X,[1,2,3,4,5,6,7]),print_piece(pos(X,Y),Pieces)),_), write('|'),nl.

print_piece(pos(X,Y),Pieces) :- member(P,[a,b,c,d,e,f,g,h,i]), member(piece(P,Pos),Pieces), member(pos(X,Y),Pos), write(P), !.
print_piece(_,_) :- write(' ').

piece(a,[pos(X0,Y0),pos(X0,Y1),pos(X0,Y2),pos(X0,Y3),pos(X0,Y4)]) :- 
    member(X0,[1,2,3,4,5,6,7]), member(Y0,[1,2,3]),
    Y1 is Y0 + 1, Y2 is Y0 + 2, Y3 is Y0 + 3, Y4 is Y0 + 4.
piece(a,[pos(X0,Y0),pos(X1,Y0),pos(X2,Y0),pos(X3,Y0),pos(X4,Y0)]) :- 
    member(X0,[1,2,3]), member(Y0,[1,2,3,4,5,6,7]),
    X1 is X0 + 1, X2 is X0 + 2, X3 is X0 + 3, X4 is X0 + 4.
piece(b,[pos(X0,Y0),pos(X0,Y1)]) :-
    member(X0,[1,2,3,4,5,6,7]), member(Y0,[1,2,3,4,5,6]),
    Y1 is Y0 + 1.
piece(b,[pos(X0,Y0),pos(X1,Y0)]) :-
    member(X0,[1,2,3,4,5,6]), member(Y0,[1,2,3,4,5,6,7]),
    X1 is X0 + 1.
piece(c,[pos(X0,Y0),pos(X1,Y0),pos(X1,Y1),pos(X2,Y0)]) :-
    member(X0,[1,2,3,4,5]), member(Y0,[1,2,3,4,5,6]),
    X1 is X0 + 1, X2 is X0 + 2, Y1 is Y0 + 1.
piece(c,[pos(X0,Y1),pos(X1,Y0),pos(X1,Y1),pos(X2,Y1)]) :-
    member(X0,[1,2,3,4,5]), member(Y0,[1,2,3,4,5,6]),
    X1 is X0 + 1, X2 is X0 + 2, Y1 is Y0 + 1.
piece(c,[pos(X0,Y0),pos(X0,Y1),pos(X0,Y2),pos(X1,Y1)]) :-
    member(X0,[1,2,3,4,5,6]), member(Y0,[1,2,3,4,5]),
    X1 is X0 + 1, Y1 is Y0 + 1, Y2 is Y0 + 2.
piece(c,[pos(X0,Y1),pos(X1,Y0),pos(X1,Y1),pos(X1,Y2)]) :-
    member(X0,[1,2,3,4,5,6]), member(Y0,[1,2,3,4,5]),
    X1 is X0 + 1, Y1 is Y0 + 1, Y2 is Y0 + 2.
piece(d,[pos(X0,Y1),pos(X0,Y2),pos(X1,Y0),pos(X1,Y1),pos(X2,Y0)]) :-
    member(X0,[1,2,3,4,5]), member(Y0,[1,2,3,4,5]),
    X1 is X0 + 1, X2 is X0 + 2, Y1 is Y0 + 1, Y2 is Y0 + 2.
piece(d,[pos(X0,Y0),pos(X0,Y1),pos(X1,Y1),pos(X1,Y2),pos(X2,Y2)]) :-
    member(X0,[1,2,3,4,5]), member(Y0,[1,2,3,4,5]),
    X1 is X0 + 1, X2 is X0 + 2, Y1 is Y0 + 1, Y2 is Y0 + 2.
piece(d,[pos(X0,Y2),pos(X1,Y1),pos(X1,Y2),pos(X2,Y0),pos(X2,Y1)]) :-
    member(X0,[1,2,3,4,5]), member(Y0,[1,2,3,4,5]),
    X1 is X0 + 1, X2 is X0 + 2, Y1 is Y0 + 1, Y2 is Y0 + 2.
piece(d,[pos(X0,Y0),pos(X1,Y0),pos(X1,Y1),pos(X2,Y1),pos(X2,Y2)]) :-
    member(X0,[1,2,3,4,5]), member(Y0,[1,2,3,4,5]),
    X1 is X0 + 1, X2 is X0 + 2, Y1 is Y0 + 1, Y2 is Y0 + 2.
piece(e,[pos(X0,Y0),pos(X0,Y1),pos(X0,Y2),pos(X0,Y3),pos(X1,Y1)]) :-
    member(X0,[1,2,3,4,5,6]), member(Y0,[1,2,3,4]),
    X1 is X0 + 1, Y1 is Y0 + 1, Y2 is Y0 + 2, Y3 is Y0 + 3.
piece(e,[pos(X0,Y1),pos(X1,Y0),pos(X1,Y1),pos(X2,Y1),pos(X3,Y1)]) :-
    member(X0,[1,2,3,4]), member(Y0,[1,2,3,4,5,6]),
    X1 is X0 + 1, X2 is X0 + 2, X3 is X0 + 3, Y1 is Y0 + 1.
piece(e,[pos(X0,Y2),pos(X1,Y0),pos(X1,Y1),pos(X1,Y2),pos(X1,Y3)]) :-
    member(X0,[1,2,3,4,5,6]), member(Y0,[1,2,3,4]),
    X1 is X0 + 1, Y1 is Y0 + 1, Y2 is Y0 + 2, Y3 is Y0 + 3.
piece(e,[pos(X0,Y0),pos(X1,Y0),pos(X2,Y0),pos(X2,Y1),pos(X3,Y0)]) :-
    member(X0,[1,2,3,4]), member(Y0,[1,2,3,4,5,6]),
    X1 is X0 + 1, X2 is X0 + 2, X3 is X0 + 3, Y1 is Y0 + 1.
piece(f,[pos(X0,Y2),pos(X1,Y1),pos(X1,Y2),pos(X2,Y0),pos(X2,Y1),pos(X2,Y2)]) :-
    member(X0,[1,2,3,4,5]), member(Y0,[1,2,3,4,5]),
    X1 is X0 + 1, X2 is X0 + 2, Y1 is Y0 + 1, Y2 is Y0 + 2.
piece(f,[pos(X0,Y0),pos(X1,Y0),pos(X1,Y1),pos(X2,Y0),pos(X2,Y1),pos(X2,Y2)]) :-
    member(X0,[1,2,3,4,5]), member(Y0,[1,2,3,4,5]),
    X1 is X0 + 1, X2 is X0 + 2, Y1 is Y0 + 1, Y2 is Y0 + 2.
piece(f,[pos(X0,Y0),pos(X0,Y1),pos(X0,Y2),pos(X1,Y1),pos(X1,Y2),pos(X2,Y2)]) :-
    member(X0,[1,2,3,4,5]), member(Y0,[1,2,3,4,5]),
    X1 is X0 + 1, X2 is X0 + 2, Y1 is Y0 + 1, Y2 is Y0 + 2.
piece(f,[pos(X0,Y0),pos(X0,Y1),pos(X0,Y2),pos(X1,Y0),pos(X1,Y1),pos(X2,Y0)]) :-
    member(X0,[1,2,3,4,5]), member(Y0,[1,2,3,4,5]),
    X1 is X0 + 1, X2 is X0 + 2, Y1 is Y0 + 1, Y2 is Y0 + 2.
piece(g,[pos(X0,Y0),pos(X0,Y1),pos(X1,Y0),pos(X1,Y1),pos(X1,Y2),pos(X2,Y0),pos(X2,Y1)]) :-
    member(X0,[1,2,3,4,5]), member(Y0,[1,2,3,4,5]),
    X1 is X0 + 1, X2 is X0 + 2, Y1 is Y0 + 1, Y2 is Y0 + 2.
piece(g,[pos(X0,Y0),pos(X0,Y1),pos(X0,Y2),pos(X1,Y0),pos(X1,Y1),pos(X1,Y2),pos(X2,Y1)]) :-
    member(X0,[1,2,3,4,5]), member(Y0,[1,2,3,4,5]),
    X1 is X0 + 1, X2 is X0 + 2, Y1 is Y0 + 1, Y2 is Y0 + 2.
piece(g,[pos(X0,Y1),pos(X0,Y2),pos(X1,Y0),pos(X1,Y1),pos(X1,Y2),pos(X2,Y1),pos(X2,Y2)]) :-
    member(X0,[1,2,3,4,5]), member(Y0,[1,2,3,4,5]),
    X1 is X0 + 1, X2 is X0 + 2, Y1 is Y0 + 1, Y2 is Y0 + 2.
piece(g,[pos(X0,Y1),pos(X1,Y0),pos(X1,Y1),pos(X1,Y2),pos(X2,Y0),pos(X2,Y1),pos(X2,Y2)]) :-
    member(X0,[1,2,3,4,5]), member(Y0,[1,2,3,4,5]),
    X1 is X0 + 1, X2 is X0 + 2, Y1 is Y0 + 1, Y2 is Y0 + 2.
piece(h,[pos(X0,Y0),pos(X0,Y1),pos(X0,Y2),pos(X0,Y3),pos(X1,Y1),pos(X1,Y2)]) :-
    member(X0,[1,2,3,4,5,6]), member(Y0,[1,2,3,4]),
    X1 is X0 + 1, Y1 is Y0 + 1, Y2 is Y0 + 2, Y3 is Y0 + 3.
piece(h,[pos(X0,Y1),pos(X0,Y2),pos(X1,Y0),pos(X1,Y1),pos(X1,Y2),pos(X1,Y3)]) :-
    member(X0,[1,2,3,4,5,6]), member(Y0,[1,2,3,4]),
    X1 is X0 + 1, Y1 is Y0 + 1, Y2 is Y0 + 2, Y3 is Y0 + 3.
piece(h,[pos(X0,Y0),pos(X1,Y0),pos(X1,Y1),pos(X2,Y0),pos(X2,Y1),pos(X3,Y0)]) :-
    member(X0,[1,2,3,4]), member(Y0,[1,2,3,4,5,6]),
    X1 is X0 + 1, X2 is X0 + 2, X3 is X0 + 3, Y1 is Y0 + 1.
piece(h,[pos(X0,Y1),pos(X1,Y0),pos(X1,Y1),pos(X2,Y0),pos(X2,Y1),pos(X3,Y1)]) :-
    member(X0,[1,2,3,4]), member(Y0,[1,2,3,4,5,6]),
    X1 is X0 + 1, X2 is X0 + 2, X3 is X0 + 3, Y1 is Y0 + 1.
piece(i,[pos(X0,Y1),pos(X0,Y2),pos(X1,Y1),pos(X1,Y2),pos(X1,Y3),pos(X2,Y0),pos(X2,Y1),pos(X2,Y2)]) :-
    member(X0,[1,2,3,4,5]), member(Y0,[1,2,3,4]),
    X1 is X0 + 1, X2 is X0 + 2, Y1 is Y0 + 1, Y2 is Y0 + 2, Y3 is Y0 + 3.
piece(i,[pos(X0,Y0),pos(X1,Y0),pos(X1,Y1),pos(X1,Y2),pos(X2,Y0),pos(X2,Y1),pos(X2,Y2),pos(X3,Y1)]) :-
    member(X0,[1,2,3,4]), member(Y0,[1,2,3,4,5]),
    X1 is X0 + 1, X2 is X0 + 2, X3 is X0 + 3, Y1 is Y0 + 1, Y2 is Y0 + 2.
piece(i,[pos(X0,Y1),pos(X0,Y2),pos(X0,Y3),pos(X1,Y0),pos(X1,Y1),pos(X1,Y2),pos(X2,Y1),pos(X2,Y2)]) :-
    member(X0,[1,2,3,4,5]), member(Y0,[1,2,3,4]),
    X1 is X0 + 1, X2 is X0 + 2, Y1 is Y0 + 1, Y2 is Y0 + 2, Y3 is Y0 + 3.
piece(i,[pos(X0,Y1),pos(X1,Y0),pos(X1,Y1),pos(X1,Y2),pos(X2,Y0),pos(X2,Y1),pos(X2,Y2),pos(X3,Y2)]) :-
    member(X0,[1,2,3,4]), member(Y0,[1,2,3,4,5]),
    X1 is X0 + 1, X2 is X0 + 2, X3 is X0 + 3, Y1 is Y0 + 1, Y2 is Y0 + 2.


