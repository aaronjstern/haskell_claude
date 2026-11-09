square :: Int -> Int
square x = x * x

sumOfSquares :: Int -> Int -> Int
sumOfSquares x y = square x + square y

half :: Int -> Double
half x = fromIntegral (x) / 2

toFahrenheit :: Double -> Double
toFahrenheit c = c * 9/5 + 32

averageOfSquares :: Int -> Int -> Double
averageOfSquares x y = half (sumOfSquares x y)

area :: Int -> Int -> Double
area w h = fromIntegral (w * h)
