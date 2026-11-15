grade :: Int -> Char
grade x
    | x >= 90 = 'A'
    | x >= 80 = 'B'
    | x >= 70 = 'C'
    | otherwise = 'F'

isVowel :: Char -> Bool
isVowel 'a' = True
isVowel 'e' = True
isVowel 'i' = True
isVowel 'o' = True
isVowel 'u' = True
isVowel _   = False

maxOf :: Int -> Int -> Int
maxOf x y = if x > y then x else y

bmiCategory :: Double -> String
bmiCategory x
    | x < 18.5 = "under"
    | x < 25 = "normal"
    | x < 30 = "over"
    | otherwise = "obese"

bmiLabel :: Int -> Int -> String
bmiLabel weight height =  bmiCategory (fromIntegral weight / ((fromIntegral height * 0.01) ^ (2 :: Int)))

dayName :: Int -> String
dayName 1 = "Mon"
dayName 2 = "Tues"
dayName 3 = "Weds"
dayName 4 = "Thurs"
dayName 5 = "Fri"
dayName 6 = "Sat"
dayName 7 = "Sun"
dayName _ = "invalid"

bothPositive :: Int -> Int -> Bool
bothPositive x y
    | x <= 0 = False
    | y <= 0 = False
    | otherwise = True

xor :: Bool -> Bool -> Bool
xor True False = True
xor False True = True
xor _ _ = False

xor2 :: Bool -> Bool -> Bool
xor2 True y = not y
xor2 False y = y

clamp :: Int -> Int -> Int -> Int
clamp lo hi x
    | x > hi = hi
    | x < lo = lo
    | otherwise = x

both :: Bool -> Bool -> Bool
both True True = True
both _ _ = False

zeros :: Int -> Int -> String
zeros 0 0 = "both"
zeros 0 _ = "first"
zeros _ 0 = "second"
zeros _ _ = "none"