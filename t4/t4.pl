assasino(X,Y) :- motivacao(X,Y), acesso(X,_,_,_).

acesso(X,Y,Z,Y1) :-
  (bastao(X,Y) ; martelo(X,Y)),
  chave(X,Z),
  presente(X,Y1),
  Y \= Z,Y \= Y1,Y1 \= Z.

%momento do crime
presente(X,Y):-
  sexta(X,apartamento),Y=sexta;
  quinta(X,apartamento),Y=quinta.

%dinheiro
dinheiro(X) :- pobre(X).

%O bastão de baseball que foi roubado do amigo pobre de Anita, Bernardo, na quinta-feira em Porto Alegre ou na quarta-feira em Santa MariaO martelo que foi roubado da caixa de ferramentas do apartamento na quarta ou na quinta-feira.
bastao(X,Y) :-
  (quinta(X,porto_alegre),Y=quinta);(quarta(X,santa_maria),Y=quarta).

%O martelo que foi roubado da caixa de ferramentas do apartamento na quarta ou na quinta-feira.
martelo(X,Y) :-
  (quarta(X,apartamento),Y=quarta);(quinta(X,apartamento),Y=quinta).

%motivos
motivacao(X,Y) :- insano(X),Y = insanidade.
motivacao(X,Y) :- dinheiro(X), Y = dinheiro.
motivacao(X,Y) :- ciumes(X),Y = ciumes.

%vitima
vitima(anita).

%ciumes
ciumes(X) :- relacionamento(anita,Y),relacionamento(Y,X).

%chave
chave(X,Y) :- (quarta(X,santa_maria),Y=quarta);(terca(X,porto_alegre),Y=terca).

%dinheiro
dinheiro(X) :- pobre(X).

%Bia, que é pobre, tem uma cópia da chave
chave(bia).
pobre(bia).

%Adriano e Maria já visitaram um psiquiatra para tratar transtornos psicóticos.
insano(maria).
insano(adriano).

%dividia quarto
quarto(bia).
quarto(pedro).
quarto(caren).
quarto(henrique).
quarto(adriano).
quarto(alice).
quarto(bernardo).
quarto(maria).

%Anita tem um relacionamento com Bernardo, que por sua vez teve um relacionamento com a garota rica Caren.
relacionamento(anita,bernardo).
relacionamento(bernardo,caren).
rico(caren).

%Anita teve um relacionamento com Pedro, que é pobre e namorou com a garota rica Alice.
relacionamento(anita,pedro).
pobre(pedro).
relacionamento(pedro,alice).
rico(alice).

%Alice namorou com o igualmente rico Henrique.
relacionamento(alice,henrique).
rico(henrique).
%Henrique tinha sido noivo de Maria, que é pobre. Maria costumava sair com Adriano, que é rico, e já namorou com a menina rica Caren.
relacionamento(henrique,maria).
pobre(maria).
relacionamento(maria,adriano).
rico(adriano).
relacionamento(adriano,caren).

%Pedro estava em Santa Maria na segunda e na terça-feira, em Porto Alegre na quarta, em Santa Maria novamente na quinta e depois voltou ao apartamento.
segunda(pedro,santa_maria).
terca(pedro,santa_maria).
quarta(pedro,porto_alegre).
quinta(pedro,santa_maria).
sexta(pedro,apartamento).

%Caren ficou em Porto Alegre de segunda a quarta-feira, esteve em Santa Maria na quinta e na sexta ficou no apartamento.
segunda(caren,porto alegre).
terca(caren,porto_alegre).
quarta(caren,porto_alegre).
quinta(caren,santa_maria).
sexta(caren,apartamento).

%Henrique esteve no apartamento na segunda, em Porto Alegre na terça e depois voltou para o apartamento.
segunda(henrique,apartamento).
terca(henrique,porto_alegre).
quarta(henrique,apartamento).
quinta(henrique,apartamento).
sexta(henrique,apartamento).

%Bia passou a segunda-feira no apartamento, esteve em Porto Alegre na terça e quarta e foi para Santa Maria na quinta, então retornou para o apartamento na sexta-feira.
segunda(bia,apartamento).
terca(bia,porto_alegre).
quarta(bia,porto_alegre).
quinta(bia,santa_maria).
sexta(bia,apartamento).

%Adriano estava em Santa Maria quarta-feira e ficou no apartamento o resto da semana.
segunda(adriano,apartamento).
terca(adriano,apartamento).
quarta(adriano,santa_maria).
quinta(adriano,apartamento).
sexta(adriano,apartamento).

%Alice estava em Porto Alegre terça e quarta-feira e no apartamento segunda, quinta e sexta-feira.
segunda(alice,apartamento).
terca(alice,porto_alegre).
quarta(alice,porto_alegre).
quinta(alice,apartamento).
sexta(alice,apartamento).

%Bernardo estava em Santa Maria segunda e terça-feira, em Porto Alegre na quarta-feira, em Santa Maria novamente na quinta-feira e no apartamento na sexta.
segunda(bernardo,santa_maria).
terca(bernardo,santa_maria).
quarta(bernardo,porto_alegre).
quinta(bernardo,santa_maria).
sexta(bernardo,apartamento).

%Maria esteve em Santa Maria de terça a quinta-feira e no apartamento na segunda e na sexta-feira.
segunda(maria,apartamento).
terca(maria,santa_maria).
quarta(maria,santa_maria).
quinta(maria,santa_maria).
sexta(maria,apartamento).
