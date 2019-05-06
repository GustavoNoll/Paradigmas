assassino(X,Y) :- motivacao(X,Y), acesso(X),!.

acesso(X) :-
  (bastao(X) ; martelo(X)),
  chave(X),
  presente(X).

%momento do crime
presente(X):-
  sexta(X,apartamento);
  quinta(X,apartamento).

%dinheiro
dinheiro(X) :- pobre(X).

%O bastão de baseball que foi roubado do amigo pobre de Anita, Bernardo, na quinta-feira em Porto Alegre ou na quarta-feira em Santa MariaO martelo que foi roubado da caixa de ferramentas do apartamento na quarta ou na quinta-feira.
bastao(X) :-
  quinta(X,porto_alegre);quarta(X,santa_maria).

%O martelo que foi roubado da caixa de ferramentas do apartamento na quarta ou na quinta-feira.
martelo(X) :-
  quarta(X,apartamento);quinta(X,apartamento).

%motivos
motivacao(X,Y) :- insano(X),Y = insanidade.
motivacao(X,Y) :- dinheiro(X), Y = dinheiro.
motivacao(X,Y) :- ciumes(X),Y = ciumes.

%vitima
vitima(anita).

%ciumes
ciumes(X) :- relacionamento(anita,Y),relacionamento(Y,X).

%chave
chave(X) :- segunda(X,santa_maria);terca(X,porto_alegre).
chave(bia).

%pobre
pobre(bia).
pobre(pedro).
pobre(maria).

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
%Anita teve um relacionamento com Pedro, que é pobre e namorou com a garota rica Alice.
relacionamento(anita,pedro).
relacionamento(pedro,alice).
%Alice namorou com o igualmente rico Henrique.
relacionamento(alice,henrique).
%Henrique tinha sido noivo de Maria, que é pobre. Maria costumava sair com Adriano, que é rico, e já namorou com a menina rica Caren.
relacionamento(henrique,maria).
relacionamento(maria,adriano).
relacionamento(adriano,caren).

%Pedro estava em Santa Maria na segunda e na terça-feira, em Porto Alegre na quarta, em Santa Maria novamente na quinta e depois voltou ao apartamento.
%Caren ficou em Porto Alegre de segunda a quarta-feira, esteve em Santa Maria na quinta e na sexta ficou no apartamento.
%Henrique esteve no apartamento na segunda, em Porto Alegre na terça e depois voltou para o apartamento.
%Bia passou a segunda-feira no apartamento, esteve em Porto Alegre na terça e quarta e foi para Santa Maria na quinta, então retornou para o apartamento na sexta-feira.
%Adriano estava em Santa Maria quarta-feira e ficou no apartamento o resto da semana.
%Alice estava em Porto Alegre terça e quarta-feira e no apartamento segunda, quinta e sexta-feira.
%Bernardo estava em Santa Maria segunda e terça-feira, em Porto Alegre na quarta-feira, em Santa Maria novamente na quinta-feira e no apartamento na sexta.
%Maria esteve em Santa Maria de terça a quinta-feira e no apartamento na segunda e na sexta-feira.
segunda(bernardo,santa_maria).
segunda(maria,apartamento).
segunda(alice,apartamento).
segunda(adriano,apartamento).
segunda(bia,apartamento).
segunda(henrique,apartamento).
segunda(caren,porto_alegre).
segunda(pedro,santa_maria).
terca(bernardo,santa_maria).
terca(maria,santa_maria).
terca(alice,porto_alegre).
terca(adriano,apartamento).
terca(bia,porto_alegre).
terca(henrique,porto_alegre).
terca(caren,porto_alegre).
terca(pedro,santa_maria).
quarta(bernardo,porto_alegre).
quarta(maria,santa_maria).
quarta(alice,porto_alegre).
quarta(adriano,santa_maria).
quarta(bia,porto_alegre).
quarta(henrique,apartamento).
quarta(caren,porto_alegre).
quarta(pedro,porto_alegre).
quinta(bernardo,santa_maria).
quinta(maria,santa_maria).
quinta(alice,apartamento).
quinta(adriano,apartamento).
quinta(bia,santa_maria).
quinta(henrique,apartamento).
quinta(caren,santa_maria).
quinta(pedro,santa_maria).
sexta(bernardo,apartamento).
sexta(maria,apartamento).
sexta(alice,apartamento).
sexta(adriano,apartamento).
sexta(bia,apartamento).
sexta(henrique,apartamento).
sexta(caren,apartamento).
sexta(pedro,apartamento).
