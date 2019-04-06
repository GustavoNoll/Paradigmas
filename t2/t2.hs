import Text.Printf

type Point     = (Float,Float)
type Rect      = (Point,Float,Float)
type Circle    = (Point,Float)


-------------------------------------------------------------------------------
-- Paletas
-------------------------------------------------------------------------------

toInt :: Float -> Int
toInt x = round x

rgbPalette :: Int -> [(Int,Int,Int)]
rgbPalette n = take 10 $ cycle [(255,0,0),(0,255,0),(0,0,255)]

greenPaletteR :: Int -> Int -> Int-> [(Int,Int,Int)]
greenPaletteR n linha coluna= [(0,30+i*20+j*20,0) | i <- [0..linha-1] , j <- [0..coluna-1]]

greenPaletteC :: Int-> [(Int,Int,Int)]
greenPaletteC n= [(toInt(sin(0.40*i)* 127 + 128),toInt(sin(0.4*i+2)* 127 + 128),toInt(sin(0.4*i + 4)* 127 + 128)) | i <- [0..fromIntegral(n-1)]]




-------------------------------------------------------------------------------
-- Geração de retângulos em suas posições
-------------------------------------------------------------------------------


genRectsInLinexLine :: Int -> [Rect]
genRectsInLinexLine n  = [((m*(w+gapx),y*(w+gapy)),w,h) | y <- [0..fromIntegral (n-1)],m <- [0..fromIntegral (n-1)]]
  where (w,h) = (50,50)
        gapy = 25
        gapx = 10


toRad :: Float -> Float
toRad i = ((i* 30.00) * (pi/180))

genRectsInCirc :: Int -> [Circle]
genRectsInCirc n  = [(((gap) * cos(toRad i) + 130, (gap) * sin(toRad i)+130),r) | i <- [0..fromIntegral(n-1)]]
   where gap=r*2+50
         r=25
   


-------------------------------------------------------------------------------
-- Strings SVG
-------------------------------------------------------------------------------

-- Gera string representando retângulo SVG 
-- dadas coordenadas e dimensoes do retângulo e uma string com atributos de estilo
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
-- Recebe uma funcao geradora de strings SVG, uma lista de círculos/retângulos e strings de estilo
svgElements :: (a -> String -> String) -> [a] -> [String] -> String
svgElements func elements styles = concat $ zipWith func elements styles

-------------------------------------------------------------------------------
-- Função principal que gera arquivo com imagem SVG
-------------------------------------------------------------------------------

main :: IO ()
main = do
  writeFile "case1.svg" $ svgstrs
  where svgstrs = svgBegin w h ++ svgfigs ++ svgEnd
        svgfigs = svgElements svgRect rects (map svgStyle palette)
        rects = genRectsInLinexLine nrects
        palette = greenPaletteR nrects 5 10
        nrects = 10
        (w,h) = (1500,500) -- width,height da imagem SVG


circ :: IO ()
circ = do
  writeFile "case2.svg" $ svgstrs
  where svgstrs = svgBegin w h ++ svgfigs ++ svgEnd
        svgfigs = svgElements svgCirc circs (map svgStyle palette)
        circs = genRectsInCirc ncircs
        palette = greenPaletteC ncircs
        ncircs = 12
        (w,h) = (1500,500) -- width,height da imagem SVG