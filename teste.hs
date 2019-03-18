las--1
sumSquares :: Int->Int-> Int
sumSquares x y= x^2 + y^2

--2
hasEqHeads :: [Int] -> [Int] -> Bool
hasEqHeads x y = if (head x) == (head y) then True else False
--3
conc:: [String] -> [String]
conc x = map ("Super" ++) (x)
--4
filtesp:: Char -> Bool
filtesp x= x /= ' ' 

esp:: String->Int
esp x = length (map filtesp x)

--5
calc :: [Float] -> [Float]
calc x= map (\n -> 3*n^2 + 2/n + 1) x

--6
nebase:: Int-> Bool
nebase x = x < 0


negat :: [Int] -> [Int]
negat x = filter nebase x

--7
return1 :: Int -> Bool
return1 x = x<1 || x>100

return1entre100 :: [Int] -> [Int]
return1entre100 x= filter return1 x

--8
nasc1980 :: Int -> Bool
nasc1980 x = (2019-x) > 1979 

listNasc :: [Int] -> [Int]
listNasc x= filter nasc1980 x

--9

par :: Int -> Bool
par x = mod x 2 == 0 

pares :: [Int] -> [Int]
pares x= filter par x

--10
charBase :: Char -> Char -> Bool
charBase x y = x == y

charFound :: Char -> String -> Bool
charFound x y = any (==True) (map (charBase x) y)

--11
terminA :: String-> Bool
terminA x = (last x) == 'a'

lastA:: [String] -> [String]
lastA x =  filter terminA x