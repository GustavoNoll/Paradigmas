#Eliza,explained
  Esse arquivo irá explicar como funciona o chatbot Eliza,
um dos primeiros 'chatter bot' da história.
  Eliza funciona através de regras, primeiramente busca-se as palavras digitadas pelo usuário e tenta combinar essas palavras com alguma regra já definida
para gerar uma resposta ao usuário.

1. **Start**
  O programa começa com um boas vindas e roda em um loop. Quando o usuário responde a Eliza, o programa separa a frase em palavras. Então, o bot tenta combinar
essas palavras com as palavras-chaves(keywords) definida nas regras.
</p>

2. **Keyword matching**
  O sistema de matching entra em cena após a frase ser separada em palavras. As regras estabelecidas, contém duas lacunas, keyword e importância da keyword. A
partir da maior importância as palavras da frase digitada são testadas com as keyword. Ao achar, o bot entra no script da keyword.

3. **Response matching**
  As respostas são baseadas em padrões que envolvam a keyword. Por exemplo, digamos que houve um match de uma frase 'what do you sell', com a keyword 'sell', para
decidir qual tipo de resposta que o bot irá dar, pode ser dado padrões, como [1,[what,_,i,sell,_]. '1' é o numero do padrão,[what,_,i,sell,_] é o padrão, ou seja, quando houve essas palavras, nessa ordem irá entrar nessa seção de resposta. Simplificando, quando o frase digitada pelo usuário tiver o mesmo padrão desse response matching irá dar uma das respostas disponíveis.
