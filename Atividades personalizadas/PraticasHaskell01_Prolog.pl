%Exercicios da pratica Haskell01 em Prolog

sumSquares(X,Y,L) :- L is X^2 + Y^2.

hasEqHeads([],_,[]).
hasEqHeads(_,[],[]).
hasEqHeads(L,N) :-L=[H|_],N=[H1|_], H1==H.

prefixo([],[]).
prefixo(S,L) :- S=[H|T],L=[H1|T1],string_concat("Super",H,H1),prefixo(T,T1),!.

calcExpr([],[]).
calcExpr([H|T],S) :- H1 is 3*H^2 + 2/H +1,calcExpr(T,Resto), S=[H1|Resto],!.
calcExpr([_|T],S) :- calcExpr(T,S).

negat([],[]).
negat([H|T],S) :- H<0,negat(T,Resto), S=[H|Resto],!.
negat([_|T],S) :- negat(T,S).

entre1e100([],[]).
entre1e100([H|T],S) :- H>1,H<100,entre1e100(T,Resto), S=[H|Resto],!.
entre1e100([_|T],S) :- entre1e100(T,S).

maioresde1980([],[]).
maioresde1980([H|T],S) :- Ano is 2019-H,Ano>1980,maioresde1980(T,Resto), S=[H|Resto],!.
maioresde1980([_|T],S) :- maioresde1980(T,S).

onlyEven([],[]).
onlyEven(L1,L2) :-L1 = [H|T], L2 = [H1|T1],0 is mod(H,2),H1 is H,onlyEven(T,T1), !.
onlyEven(L1,L2) :- L1 = [_|T],onlyEven(T,L2),!.

charFound(C,S) :- member(C,S).

spaceN(X,N) :- split_string(X," ","",Words),length(Words,A),N is A -1.
