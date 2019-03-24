import Data.Char
--Crie uma função isVowel :: Char -> Bool que verifique se um caracter é uma vogal ou não.
--1
isVowel :: Char-> Bool
isVowel letter= if length(filter(\l -> l ==letter) "aeiouAEIOU") > 0 then True else False
--2
--Escreva uma função addComma, que adicione uma vírgula no final de cada string contida numa lista.
addComma :: [String] -> [String]
addComma list=map (++ ",") list


--3
--Crie uma função htmlListItems :: [String] -> [String], que receba uma lista de strings e retorne outra lista contendo as strings formatadas como itens de lista em HTML.
concathtml x = "<LI>" ++ x ++ "<LI>"
htmlListItems :: [String] -> [String]
htmlListItems list =map concathtml list

htmlListItems' :: [String] -> [String]
htmlListItems' list= map(\s -> "<LI>" ++ s ++ "<LI>") list

--4
--efina uma função que receba uma string e produza outra retirando as vogais, conforme os exemplos abaixo.
semVogais' :: String -> String
semVogais' palavra = filter(\l -> l /= 'A' && l/= 'E' && l/= 'I' && l/= 'O' && l/= 'U' && l/= 'a' && l/= 'e' && l/= 'i' && l/= 'o' && l/= 'u' ) palavra

semVogal :: Char-> Bool
semVogal x = length(filter(\l -> l == x) "aeiouAEIOU") == 0

semVogais :: String -> String
semVogais str= filter semVogal str

--5
--Defina uma função que receba uma string, possivelmente contendo espaços, e que retorne outra string substituindo os demais caracteres por '-', mas mantendo os espaços.
codifica' :: String -> String
codifica' str = map(\l -> if  l == ' ' then l else '-') str

codAux :: Char -> Char
codAux c = if c== ' ' then c else '-'
codifica :: String -> String
codifica str = map codAux str


--6
--creva uma função firstName :: String -> String que, dado o nome completo de uma pessoa, obtenha seu primeiro nome. Suponha que cada parte do nome seja separada por um espaço e que não existam espaços no início ou fim do nome.
firstName :: String -> String
firstName str = takeWhile (/=' ') str

--7
--Escreva uma função isInt :: String -> Bool que verifique se uma dada string só contém dígitos de 0 a 9.
contN :: Char -> Bool
contN l = l/='0' && l/='1' && l/='2' && l/='3' && l/='4' && l/='5' && l/='6' && l/='7' && l/='8' && l/='9'

isInt :: String -> Bool
isInt str = length(filter (contN) str)==0

--8
--Escreva uma função lastName :: String -> String que, dado o nome completo de uma pessoa, obtenha seu último sobrenome. Suponha que cada parte do nome seja separada por um espaço e que não existam espaços no início ou fim do nome.
lastName :: String -> String
lastName str = last(words str)

--9
--Escreva uma função userName :: String -> String que, dado o nome completo de uma pessoa, crie um nome de usuário (login) da pessoa, formado por: primeira letra do nome seguida do sobrenome, tudo em minúsculas.
toLow:: Char-> Char
toLow l = toLower l
userName :: String -> String
userName user = map toLow(take 1 (head(words user)) ++ last(words user))

--10
--Escreva uma função encodeName :: String -> String que substitua vogais em uma string, conforme o esquema a seguir: a = 4, e = 3, i = 2, o = 1, u = 0.
encodeAux :: Char -> Char
encodeAux l
    | l== 'A'= '4'
    | l== 'E'='3'
    | l== 'I'='2'
    | l== 'O'='1'
    | l== 'U'='0'
    | l== 'a'= '4'
    | l== 'e'='3'
    | l== 'i'='2'
    | l== 'o'='1'
    | l== 'u'='0'
    | otherwise = l

encodeName :: String -> String
encodeName str = map encodeAux str


--11
--Escreva uma função betterEncodeName :: String -> String que substitua vogais em uma string, conforme este esquema: a = 4, e = 3, i = 1, o = 0, u = 00.

betterEncodeName :: String -> String
betterEncodeName[] = []
betterEncodeName (x:xs) = vog2num x ++ betterEncodeName xs

vog2num :: Char -> String
vog2num c
        | c == 'a'  = "4"
        | c == 'e' = "3"
        | c == 'i'= "1"
        | c == 'o' = "0"
        | c =='u'= "00"
        | c == 'A'  = "4"
        | c == 'E' = "3"
        | c == 'I'= "1"
        | c == 'O' = "0"
        | c =='U'= "00"
        | otherwise = c:[]




--12
--Dada uma lista de strings, produzir outra lista com strings de 10 caracteres, usando o seguinte esquema: strings de entrada com mais de 10 caracteres são truncadas, strings com até 10 caracteres são completadas com '.' até ficarem com 10 caracteres.
stringList :: [String] -> [String]
stringList [] = []
stringList (x:xs) | length x < 10  =  (x ++ replicate (10 - length x) '.') : stringList xs
                 | otherwise      =  take 10 x : stringList xs
