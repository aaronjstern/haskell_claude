absolute :: Int -> Int
absolute x = if x < 0 then negate x else x

sign :: Int -> Int
sign x
    | x < 0     = -1
    | x == 0    = 0
    | otherwise = 1


{-
uncomment to see incomplete-patterns warning
signPartial :: Int -> Int
signPartial x
    | x < 0 = -1
    | x > 0 = 1
-}

{-
uncomment to see redundant pattern match warning
signBad :: Int -> Int
signBad x
    | otherwise = 1
    | x < 0     = -1
    | x == 0    = 0
-}

absoluteGuards :: Int -> Int
absoluteGuards x
    | x < 0     = negate x
    | otherwise = x

describe :: Int -> String
describe 0 = "zero"
describe 1 = "one"
describe n = "many: " ++ show n

isZero :: Int -> Bool
isZero 0 = True
isZero _ = False

safeDiv :: Int -> Int -> Int
safeDiv _ 0 = 0
safeDiv x y = x `div` y