impar :: Int -> Bool
impar x = if (mod x 2) /= 0 then True else False

hasN :: [Int] -> Int
hasN xs =length(xs)

inc99 ::[Int] -> [Int]
inc99 []=[]
inc99 xs =[x+99|x<-xs]

incN :: [Int] -> Int -> [Int]
incN [] _ = []
incN xs n=[x+n|x<-xs]

comment :: [String] -> [String]
comment []=[]
comment xs=map(\s ->"%%" ++ s) xs

onlyEven :: [Int] ->[Int]
onlyEven []=[]
onlyEven xs =[x |x<-xs,not(impar(x))]

countdown :: Int -> [Int]
countdown x = [x,x-1..0]

potN0 :: Int -> [Int]
potN0 x =[y^2|y<-ys]
  where ys=countdown(x)

zipmult :: [Int]->[Int]->[Int]
zipmult xs ys = zipWith (*) xs ys

potencias :: Int -> [Int]
potencias x =[2^y|y<-ys]
  where ys=countdown(x)
