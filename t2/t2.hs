import Text.Printf

type Point     = (Float,Float)
type Rect      = (Point,Float,Float)
type Circle    = (Point,Float)


-------------------------------------------------------------------------------
-- Aux
-------------------------------------------------------------------------------
--float em int
toInt :: Float -> Int
toInt x = round x


--retorna radianos
toRad :: Float -> Int -> Float
toRad i j = ((i* 360/fromIntegral(j)) * (pi/180))

-------------------------------------------------------------------------------
-- Paletas
-------------------------------------------------------------------------------

rgbPalette :: Int -> [(Int,Int,Int)]
rgbPalette n = take n $ cycle [(255,0,0),(0,255,0),(0,0,255)]

greenPalette :: Int -> Int-> [(Int,Int,Int)]
greenPalette linha coluna= [(0,30+i*20+j*20,0) | i <- [0..linha-1] , j <- [0..coluna-1]]

redPalette :: Int -> Int-> [(Int,Int,Int)]
redPalette linha coluna= [(30+i*20+j*20,0,0) | i <- [0..linha-1] , j <- [0..coluna-1]]

bluePalette :: Int -> Int-> [(Int,Int,Int)]
bluePalette linha coluna= [(0,0,30+i*20+j*20) | i <- [0..linha-1] , j <- [0..coluna-1]]

rainbowPalette :: Int-> [(Int,Int,Int)]
rainbowPalette n= [(toInt(sin(0.40*i)* 127 + 128),toInt(sin(0.4*i+2)* 127 + 128),toInt(sin(0.4*i + 4)* 127 + 128)) | i <- [0..fromIntegral(n-1)]]




-------------------------------------------------------------------------------
-- Gera��o de ret�ngulos e circulos em suas posi��es
-------------------------------------------------------------------------------


genRectsCase1 :: Int -> Int -> [Rect]
genRectsCase1 linhas colunas  = [((m*(w+gapx),y*(w+gapy)),w,h) | y <- [0..fromIntegral (linhas-1)],m <- [0..fromIntegral (colunas-1)]]
  where (w,h) = (50,50)
        gapy = 25
        gapx = 10

genCircCase2 :: Int -> [Circle]
genCircCase2 n  =  [(((gap) * cos(toRad i n) + 130, (gap) * sin(toRad i n)+130),r) | i <- [0..fromIntegral(n-1)]]
   where gap=r*2+50
         r=25

genCircCase3 :: Int -> [Circle]
genCircCase3 n  = [((gapMenor*sin(toRad i n) + (gapMaior*j) + (r*2), (k*gapMaior) + gapMenor * (-cos(toRad i n)) + (r*2)),r) | k <- [0..fromIntegral(n-2)], j <- [0..fromIntegral(n-1)],i <- [0..fromIntegral(n-1)]]
    where gapMenor=r/2 + 7
          gapMaior= r*5
          r=30

genCircCase4 :: Int -> Int -> [Circle]
genCircCase4 n j = [(((r*2*i)+r,  k * gapColunas + coef * sin(toRad i (n-2)) + gapMaior ),r) | k <- [0..fromIntegral(j-1)], i<-[0..fromIntegral(n-1)]]
    where gapMaior =coef*2
          gapColunas=coef*3
          r=20
          coef=50

genCircCase5 :: Int -> Int -> Float ->[Circle]
genCircCase5 n j coef = [((inicialx+(i*coef),(k*coef)+inicialy),r) | i <- [0..fromIntegral(j-1)], k<-[0..fromIntegral(n-1)]]
    where inicialx =r*2
          inicialy =r
          r=50

genCircCase6 :: Int ->[Circle]
genCircCase6 n  = [((gapMenor*sin(toRad i n) + (gapMaior*j) + (r*2),gapMenor * cos(toRad i n) + (r*2)),r) |j <- [0..fromIntegral(n-(n-1))],i <- [0..fromIntegral(n-1)]]
    where gapMenor=r
          gapMaior= r*5
          r=100

-------------------------------------------------------------------------------
-- Strings SVG
-------------------------------------------------------------------------------

-- Gera string representando ret�ngulo SVG
-- dadas coordenadas e dimensoes do ret�ngulo e uma string com atributos de estilo
svgRect :: Rect -> String -> String
svgRect ((x,y),w,h) style =
  printf "<rect x='%.3f' y='%.3f' width='%.2f' height='%.2f' style='%s' />\n" x y w h style

svgCirc :: Circle -> String -> String
svgCirc ((x,y),r) style =
  printf "<circle cx='%.3f' cy='%.3f' r='%.3f' style='%s' />\n" x y r style

-- String inicial do SVG
svgBegin :: Float -> Float -> String
svgBegin w h = printf "<svg width='%.2f' height='%.2f' xmlns='http://www.w3.org/2000/svg'>\n" w h

-- String final do SVG
svgEnd :: String
svgEnd = "</svg>"

-- Gera string com atributos de estilo para uma dada cor
-- Atributo mix-blend-mode permite misturar cores
svgStyle :: (Int,Int,Int) -> String
svgStyle (r,g,b) = printf "fill:rgb(%d,%d,%d); mix-blend-mode: screen;" r g b

-- Gera strings SVG para uma dada lista de figuras e seus atributos de estilo
-- Recebe uma funcao geradora de strings SVG, uma lista de c�rculos/ret�ngulos e strings de estilo
svgElements :: (a -> String -> String) -> [a] -> [String] -> String
svgElements func elements styles = concat $ zipWith func elements styles

-------------------------------------------------------------------------------
-- Fun��o principal que gera arquivo com imagem SVG
-------------------------------------------------------------------------------

genCase1 :: IO ()
genCase1 = do
  writeFile "case1.svg" $ svgstrs
  where svgstrs = svgBegin w h ++ svgfigs ++ svgEnd
        svgfigs = svgElements svgRect rects (map svgStyle palette)
        rects = genRectsCase1 nlinhas ncolunas
        palette = greenPalette nlinhas ncolunas
        nlinhas = 5
        ncolunas = 10
        (w,h) = (1500,500) -- width,height da imagem SVG


genCase2 :: IO ()
genCase2 = do
  writeFile "case2.svg" $ svgstrs
  where svgstrs = svgBegin w h ++ svgfigs ++ svgEnd
        svgfigs = svgElements svgCirc circs (map svgStyle palette)
        circs = genCircCase2 ncircs
        palette = rainbowPalette ncircs
        ncircs = 12
        (w,h) = (1500,500) -- width,height da imagem SVG

genCase3 :: IO ()
genCase3 = do
   writeFile "case3.svg" $ svgstrs
   where svgstrs = svgBegin w h ++ svgfigs ++ svgEnd
         svgfigs = svgElements svgCirc circs (map svgStyle palette)
         circs = genCircCase3 ncircs
         palette = rgbPalette (ncircs*6)
         ncircs = 3
         (w,h) = (1500,500) -- width,height da imagem SVG

genCase4 ::IO ()
genCase4 = do
   writeFile "case4.svg" $ svgstrs
   where svgstrs = svgBegin w h ++ svgfigs ++ svgEnd
         svgfigs = svgElements svgCirc circs (map svgStyle palette)
         circs = genCircCase4 ncircs nlinhas
         palette = (redPalette 1 ncircs) ++  (greenPalette 1 ncircs) ++ (bluePalette 1 ncircs)
         nlinhas=3
         ncircs = 14
         (w,h) = (1500,500) -- width,height da imagem SVG

genCase5 :: IO()
genCase5 = do
   writeFile "case5.svg" $ svgstrs
   where svgstrs = svgBegin w h ++ svgfigs ++ svgEnd
         svgfigs = svgElements svgCirc circs (map svgStyle palette)
         circs = genCircCase5 ncircs nlinhas coef
         palette = rainbowPalette (ncircs*nlinhas)
         coef = 60-- usar entre 0 a 100, caso maior mudar raio
         nlinhas=3
         ncircs = 3
         (w,h) = (1500,500) -- width,height da imagem SVG

genCase6 ::IO()
genCase6 = do
   writeFile "case6.svg" $ svgstrs
   where svgstrs = svgBegin w h ++ svgfigs ++ svgEnd
         svgfigs = svgElements svgCirc circs (map svgStyle palette)
         circs = genCircCase6 ncircs
         palette = (bluePalette 1 ncircs) ++ rainbowPalette ncircs
         ncircs = 7
         (w,h) = (1500,500) -- width,height da imagem SVG
