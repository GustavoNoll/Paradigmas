add10toall :: [Int] -> [Int]
add10toall [] = []
add10toall xs = [x + 10 | x <- xs]

multN :: Int -> [Int] -> [Int]
multN _ [] = []
multN n xs = [x*n| x<- xs]

applyExpr :: [Int] -> [Int]
applyExpr []=[]
applyExpr xs = [3*x + 2 | x<- xs]

addSuffix :: String -> [String] -> [String]
addSuffix _ []=[]
addSuffix suf str = [s ++ suf| s<-str]

selectgt5 :: [Int] -> [Int]
selectgt5 []=[]
selectgt5 xs = [x |x<-xs,x>5]

sumOdds :: [Int] -> Int
sumOdds [] =0
sumOdds xs = sum [x |x<-xs, mod x 2 /=0]

selectExpr :: [Int] -> [Int]
selectExpr [] =[]
selectExpr xs = [x | x<-xs, mod x 2 ==0,x>20,x<50]

countShorts' :: [String] -> [String]
countShorts' str = [ s | s<-str , length(s) < 5]

countShorts :: [String] -> Int
countShorts str = length (countShorts' str)

calcExpr :: [Float] -> [Float]
calcExpr xs = filter (>10) [x*x/2 | x<-xs]

trSpaces :: String -> String
trSpaces xs = [if x == ' ' then '-' else x | x<-xs]

--a)(2,3)(2,5)(4,5)
--b)lazyfrog, lazydog,bigfrog,bigdog
--c)p-r-l-l-p-p-d

selectSnd :: [(Int,Int)] -> [Int]
selectSnd tuplas= [snd(x) | x<-tuplas]

dotProd :: [Int] -> [Int] -> Int
dotProd xs ys =  sum[fst(x) * snd(x) | x <- juntaT xs ys]

juntaT :: [Int] -> [Int] -> [(Int,Int)]
juntaT xs ys =zip xs ys

genRects :: Float -> (Float,Float) -> [(Float,Float,Float,Float)]
genRects xs tupla = [(x,snd tupla,5.5,5.5) | x <- genX tupla 5.5 xs]


genX :: (Float,Float) -> Float-> Float -> [Float]
genX tupla larg n= [fst(tupla),fst(tupla)+larg .. (n-1)*larg+fst(tupla)]
