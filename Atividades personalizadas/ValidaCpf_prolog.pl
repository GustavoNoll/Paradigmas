validaCPF(N) :-
  string_to_list(N,X),
  maplist(plus(48),Y,X),
  isCPFok(Y).

isCPFok(Y):- take(9,Y,Digitos1),expr1(Digitos1,X),dv(X,DV1),
 append(Digitos1,[DV1],Digitos2),expr2(Digitos2,Z),dv(Z,DV2),
 takeone(9,Y,FinalDV1),takeone(10,Y,FinalDV2),
 DV1 == FinalDV1,DV2==FinalDV2.

dv(N,R) :- N<2,R is 0.
dv(N,R) :- R is 11-N.

expr1(Digitos,X) :- countdownGeral(10,2,R),zipmult(Digitos,R,L),sum(L,SOMA),X is mod(SOMA,11).
expr2(Digitos,X) :- countdownGeral(11,2,R),zipmult(Digitos,R,L),sum(L,SOMA),X is mod(SOMA,11).

take(N,_,Xs) :- N=<0,!,Xs=[].
take(_,[],[]).
take(N,[X|Xs],[X|Ys]) :-M is N-1,take(M,Xs,Ys).

takeone(0,[H|_],H).
takeone(N,[_|T],R) :-M is N-1,takeone(M,T,R).

zipmult([],[],[]).
zipmult(L1,L2,L3) :-
    L1 = [H1|T1],L2 = [H2|T2],L3 = [H3|T3],
    H3 is H1*H2,
    zipmult(T1,T2,T3), !.

countdownGeral(I,N,L) :-
  I=N,L=[I],!.
countdownGeral(I,N,L) :-
  I<N,countdownC(I,N,L),!.
countdownGeral(I,N,L) :-
  I>N,countdownD(I,N,L),!.

countdownD(I,N,L) :-
  N>I,L=[].
countdownD(I, N, L) :-
  L=[H|T],
  H is I,
  I1 is I-1,
countdownD(I1, N, T), !.

countdownC(I,N,L) :-
  N<I,L=[].
countdownC(I, N, L) :-
  L=[H|T],
  H is I,
  I1 is I+1,
countdownC(I1, N, T), !.

sum([],0).
sum([H|T],S) :- sum(T, S1),S is H + S1.
