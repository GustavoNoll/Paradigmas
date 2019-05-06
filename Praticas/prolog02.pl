
is_member(A,[A|_]).
is_member(A, L) :-
  L=[_|T],
  is_member(A,T).

is_members(A,L) :-
  member(A,L).


ao_lado(X, Y , [Y,X|_]).
ao_lado(X, Y , [X,Y|_]).
ao_lado(X, Y, L) :-
  L = [_|T],
  ao_lado(X,Y,T).

ao_lados(X,Y,L) :-
  nextto(X,Y,L);
  nextto(Y,X,L).

um_entre(X,Y, [X,_,Y|_]).
um_entre(X,Y, [Y,_,X|_]).
um_entre(X, Y, L) :-
  L=[_|T],
  um_entre(X,Y,T).


  solucao(Casas, Dono_Peixe) :-
    Casas = [_, _, _, _, _], 				% a solucao � uma lista com 5 elementos
    member(casa(vermelha, ingles, _, _, _), Casas), 	% Condi��o 1: esta casa � membro da solucao
    member(casa(_, sueco, cachorro, _, _), Casas),	% Condi��o 2: esta casa tamb�m, e assim por diante
    member(casa(_, dinamarques, _, cha, _), Casas),
    nextto(casa(verde,_,_,_,_), casa(branca,_,_,_,_), Casas),
    member(casa(verde, _, _, cafe, _), Casas),
    member(casa(_, _, passaro, _, pallmall), Casas),
    member(casa(amarela, _, _, _, dunhill), Casas),
    [_, _, casa(_, _, _, leite, _), _, _] = Casas,	% Condi��o 8: na casa do centro se bebe leite
    [casa(_, noruegues, _, _, _) | _] = Casas,		% Condi��o 9: primeira casa
    ao_lado(casa(_, _, _, _, blends), casa(_, _, gato, _, _), Casas),
    ao_lado(casa(_, _, _, _, dunhill), casa(_, _, cavalo, _, _), Casas),
    member(casa(_, _, _, cerveja, bluemaster), Casas),
    member(casa(_, alemao, _, _, prince), Casas),
    ao_lado(casa(_, noruegues, _, _, _), casa(azul, _, _, _, _), Casas),
    ao_lado(casa(_, _, _, _, blends), casa(_, _, _, agua, _), Casas),
    member(casa(_, Dono_Peixe, peixe, _, _), Casas).	% Condi��o final, para saber quem cria peixes

solucao_aviao(Avioes) :-
      Avioes = [_, _, _, _, _],
      member(aviao(cel_Milton,vermelha,_,_,_),Avioes),
      member(aviao(ten_Walter,_,radio,_,_),Avioes),
      member(aviao(_,verde,_,pescar,_),Avioes),
      member(aviao(major_Rui,_,_,futebol,_),Avioes),
      nextto(aviao(_,branca,_,_,_), aviao(_,verde,_,_,_),Avioes),
      member(aviao(_,_,altimetro,_,leite),Avioes),
      member(aviao(_,preta,_,_,cerveja),Avioes),
      member(aviao(_,vermelha,_,natacao,_),Avioes),
      [aviao(cap_Farfarelli,_, _, _, _) | _] = Avioes,
      ao_lado(aviao(_,_,_,_,cafe), aviao(_,_,hidraulico,_,_),Avioes),
      ao_lado(aviao(_,_,_,_,cerveja), aviao(_,_,bussola,_,_),Avioes),
      member(aviao(_,_,_,equitacao,cha),Avioes),
      member(aviao(cap_Nascimento,_,_,_,agua),Avioes),
      ao_lado(aviao(cap_Farfarelli,_,_,_,_), aviao(_,azul,_,_,_),Avioes),
      um_entre(aviao(_,_,hidraulico,_,_), aviao(_,_,altimetro,_,_), Avioes),
      member(aviao(_,_,_,tenis,_),Avioes),
      member(aviao(_,_,temperatura,_,_), Avioes).


positivos1([],[]).
positivos1(N,L) :- N=[H|T],H > 0, positivos1(T,Resto), L = [H|Resto].
positivos1([H|T],L) :- H =< 0, positivos1(T,L).

positivos2([],[]).
positivos2([H|T],L) :- H > 0, L = [H|Resto], positivos2(T,Resto).
positivos2([H|T],L) :- H =< 0, positivos2(T,L).


largest1([X],X).
largest1([X|Xs],X) :- largest1(Xs,Y), X>=Y.
largest1([X|Xs],N) :- largest1(Xs,N), N>X.

largest2([X|Xs], N) :- aux(Xs, X, N).
aux([], N, N).
aux([X|Xs], M, N) :-
   M1 is max(X, M),
   aux(Xs, M1, N).
