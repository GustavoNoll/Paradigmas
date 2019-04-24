%1
odd(N) :- 1 is mod(N,2).

%2
hasN([],0).
hasN(L,N) :-
  L = [_|X],
  hasN(X,M),
  N is 1+M.

%3
inc99([],[]).
inc99(L1,L2) :-
  L1 = [H|T],L2 = [H1|T1],
  H1 is H+99,
  inc99(T,T1),!.

%4
incN([],[],_).
incN(L1,L2,N) :-
  L1 = [H|T], L2 = [H1|T1],
  H1 is H+N,
  incN(T,T1,N),!.

%5
comment([],[]).
comment(L1,L2) :-
  L1 = [H|T], L2 = [H1|T1],
  string_concat("%%", H, H1),
  comment(T,T1).

%6
onlyEven([],[]).
onlyEven(L1,L2) :-
  L1 = [H|T], L2 = [H1|T1],
  0 is mod(H,2),
  H1 is H,
  onlyEven(T,T1), !.

onlyEven(L1,L2) :-
  L1 = [_|T],
  onlyEven(T,L2),!.

%7
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

countdown(0,[]).
countdown(N,L) :-
  L = [H|T],
  H is N,
  R is N-1,
  countdown(R,T), !.

%8
nRandoms(0,[]).
nRandoms(N,L) :-
  L = [H|T],
  random(1,100,H),
  R is N-1,
  nRandoms(R,T), !.

%9
potN0(-1,[]).
potN0(N,L) :-
  L = [H|T],
  H is 2^N,
  R is N-1,
  potN0(R,T), !.

%10
zipmult([],[],[]).
zipmult(L1,L2,L3) :-
  L1 = [H1|T1],L2 = [H2|T2],L3 = [H3|T3],
  H3 is H1*H2,
  zipmult(T1,T2,T3), !.

%11
potencias2(I,N,L) :-
  N<I,L=[].
potencias2(I, N, L) :-
  L=[H|T],
  H is 2^I,
  I1 is I+1,
  potencias2(I1, N, T), !.

potencias(N,L) :-
  I is 0,
  potencias2(I, N, L).
