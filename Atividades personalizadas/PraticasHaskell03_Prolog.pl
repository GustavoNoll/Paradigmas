%Exercicios da pratica Haskell03 em Prolog
%1
add10toall([],[]).
add10toall(N,L) :- N=[H|T],add10toall(T,Resto), L = [J|Resto], J is H+10.

%2
multN([],_,[]).
multN(L,N,P) :-L=[H|T],multN(T,N,Resto), P=[J|Resto], J is H*10.

%3
applyExpr([],[]).
applyExpr(N,L) :- N=[H|T],applyExpr(T,Resto), L = [J|Resto], J is 3*H+2.
%4
addSuffix(_,[],[]).
addSuffix(S,N,L) :- N=[H|T],addSuffix(S,T,Resto), L = [J|Resto],string_concat(S,H,J).

%5
selectgt5([],[]).
selectgt5([H|T],L) :- H > 5, selectgt5(T,Resto), L = [H|Resto].
selectgt5([_|T],L) :- selectgt5(T,L).

%6
sumOdds([],0).
sumOdds([H|T],S) :- 1 is mod(H,2),sumOdds(T, S1),S is H + S1.
sumOdds([H|T],S) :- 0 is mod(H,2), sumOdds(T,S).

%7
selectExpr([],[]).
selectExpr([H|T],S) :- 0 is mod(H,2), H>20,H<50,selectExpr(T,Resto),S=[H|Resto].
selectExpr([_|T],S) :- selectExpr(T,S).

%8
countShorts([],0).
countShorts([H|T],S) :-string_length(H,J),countShorts(T,S1),S is J+S1.

%9
calcExpr([],[]).
calcExpr([H|T],S) :- J is H^2/2,J>10,calcExpr(T,Resto), S=[H|Resto].
calcExpr([_|T],S) :- calcExpr(T,S).

%10
replace('','').
replace(N,S) :-atomic_list_concat(L,' ',N),atomic_list_concat(L,'-',S).
