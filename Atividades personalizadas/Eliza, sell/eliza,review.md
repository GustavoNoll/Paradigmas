# Eliza,explained
  Esse arquivo irá explicar como funciona o chatbot Eliza,
um dos primeiros 'chatter bot' da história.
  Eliza funciona através de regras, primeiramente busca-se as palavras digitadas pelo usuário e tenta combinar essas palavras com alguma regra já definida
para gerar uma resposta ao usuário.

1. **Start**
  O loop principal aceita entrada do usuário e gera uma resposta. Ele divide a entrada em frases e varre cada frase para keywords ou frases. Aplica uma lista de sinônimos para corresponder palavras equivalentes. Quando o usuário responde a Eliza, o programa separa a frase em palavras. Então, o bot tenta combinar essas palavras com as keywords definida nas regras.
  
2. **Keyword matching**
  O sistema de matching entra em cena após a frase ser separada em chaves. Para cada chave, ela procura por um "padrão de decomposição", uma maneira significativa de analisar a sentença. Para isso ele faz uma operação simples de correspondência de padrões. Em alguns casos, tudo o que pode fazer é usar a chave por si só para gerar uma resposta padrão. Se houver mais de uma chave, Eliza escolhe a combinação com o maior peso possível para se decompor.

3. **Response matching**
  Em seguida,Eilza aplica um "padrões de remontagem" que seria uma resposta à entrada analisada. Por exemplo, digamos que houve um match de uma frase 'what do you sell', com a keyword 'sell', para
decidir qual tipo de resposta que o bot irá dar, pode ser dado padrões, como [1,[what,_,i,sell,_]. '1' é o numero do padrão,[what,_,i,sell,_] é o padrão, ou seja, quando houve essas palavras, nessa ordem irá entrar nessa seção de resposta. Simplificando, quando o frase digitada pelo usuário tiver o mesmo padrão desse response matching irá dar uma das respostas disponíveis.
A entrada anterior é salva e, se Eliza não puder encontrar um padrão para responder, ela pode mencionar uma declaração anterior e pedir ao usuário que a elabore. Se não houver entrada salva e nenhuma chave correspondente, a Eliza gera a chave "xnone" para trabalhar. Normalmente, ele seleciona de um conjunto de respostas padrão, como "Can you elaborate on that"
  
