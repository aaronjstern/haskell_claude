-- | n! = n * (n-1) * ... * 1, with factorial 0 = 1.
-- Errors on negative input.
factorial :: Int -> Int
factorial n
    | n < 0 = error "factorial: negative input"
    | n == 0 = 1
    | otherwise = n * factorial (n - 1)

-- | power b e is b to the e (b multiplied by itself e times).
-- Assumes e >= 0: a negative e never reaches the base case (stack overflow).
power :: Int -> Int -> Int
power _ 0 = 1
power b e = b * power b (e - 1)

-- | Number of decimal digits in n. Negative inputs count the same as
-- positive; digits 0 = 1.
digits :: Int -> Int
digits n
    | n < 0 = digits (negate n)
    | n < 10 = 1
    | otherwise = 1 + digits (n `div` 10)


-- | 1 + 2 + ... + n, with sumTo 0 = 0.
-- Errors on negative input.
sumTo :: Int -> Int
sumTo n
    | n < 0 = error "negative input"
    | n == 0 = 0
    | otherwise = n + sumTo(n - 1)


