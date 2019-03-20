--Crie uma função isVowel :: Char -> Bool que verifique se um caracter é uma vogal ou não.
--1
isVowel :: Char-> Bool
isVowel letter= if length(filter(\l -> l ==letter) "aeiouAEIOU") > 0 then True else False
--2
addComma :: [String] -> [String]
addComma list=map (++ ",") list


--3
concathtml :: String ->String
concathtml x = "<LI>" ++ x ++ "<LI>"
htmlListItems :: [String] -> [String]
htmlListItems list =map concathtml list

htmlListItems' :: [String] -> [String]
htmlListItems' list= map(\s -> "<LI>" ++ s ++ "<LI>") list

--4
semVogais' :: String -> String
semVogais' palavra = filter(\l -> l /= 'A' && l/= 'E' && l/= 'I' && l/= 'O' && l/= 'U' && l/= 'a' && l/= 'e' && l/= 'i' && l/= 'o' && l/= 'u' ) palavra

semVogal :: Char-> Bool
semVogal x = length(filter(\l -> l == x) "aeiouAEIOU") == 0

semVogais :: String -> String
semVogais str= filter semVogal str

--5
codifica' :: String -> String
codifica' str = map(\l -> if  l == ' ' then l else '-') str

codAux :: Char -> Char
codAux c = if c== ' ' then c else '-'
codifica :: String -> String
codifica str = map codAux str


--6
firstName :: String -> String
firstName str = takeWhile (/=' ') str

--7
contN :: Char -> Bool
contN l = l/='0' && l/='1' && l/='2' && l/='3' && l/='4' && l/='5' && l/='6' && l/='7' && l/='8' && l/='9'

isInt :: String -> Bool
isInt str = length(filter (contN) str)==0

--8
lastName :: String -> String
lastName str = last(words str)

--9
toLow:: Char-> Char
toLow l = toLower l
userName :: String -> String
userName user = first(toLow(words user))
