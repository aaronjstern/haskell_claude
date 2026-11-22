-- | Steps from n down to 0, subtracting 1 each time (so the result is n).
-- Errors on negative input.
countDown :: Int -> Int
countDown n
    | n < 0 = error "negative input"
    | n == 0 = 0
    | otherwise = 1 + countDown (n - 1)

{-
countDown 3
= 1 + countDown (3 - 1)
= 1 + (1 + countDown (2 - 1))
= 1 + 1 + (1 + countDown (1 - 1))
= 1 + 1 + 1 + 0
-}

-- | mult x y is x * y, using only + and recursion on y.
-- Errors on negative y.
mult :: Int -> Int -> Int
mult x y
    | y < 0 = error "negative input"
    | y == 0 = 0
    | otherwise = x + mult x (y - 1)

{-
mult 2 2
= 2 + mult 2 1
= 2 + (2 + mult 2 0)
= 2 + 2 + 0
-}

-- | Sum of the decimal digits of n. Negative inputs count the same as
-- positive.
sumDigits :: Int -> Int
sumDigits n
    | n < 0 = sumDigits (negate n)
    | n == 0 = 0
    | otherwise = n `mod` 10 + sumDigits (n `div` 10)

-- | Greatest common divisor of a and b, by Euclid's rule.
-- Assumes non-negative inputs.
euclid :: Int -> Int -> Int
euclid a 0 = a
euclid a b = euclid b (a `mod` b)

{-
euclid 12 18
= euclid 18 12
= euclid 12 6
= euclid 6 0
= 6
-}

-- | Steps for n to reach 1, halving when even and taking 3n + 1 when odd.
-- Errors on input below 1.
collatz :: Int -> Int
collatz n
    | n < 1 = error "no inputs below 1"
    | n == 1 = 0
    | even n = 1 + collatz (n `div` 2)
    | otherwise = 1 + collatz (3 * n + 1)

-- | Whether n is a power of 2 (1, 2, 4, 8, ...). False for n <= 0.
isPowerOfTwo :: Int -> Bool
isPowerOfTwo n
    | n <= 0 = False
    | n == 1 = True
    | odd n = False
    | otherwise = isPowerOfTwo (n `div` 2)

-- | Fibonacci number of n. Error for n < 0.
fib :: Int -> Int
fib n
    | n < 0 = error "negative input"
    | n == 0 = 0
    | n == 1 = 1
    | otherwise = fib (n - 1) + fib (n - 2)


{-
fib 4
= fib 3 + fib 2
= (fib 2 + fib 1) + (fib 1 + fib 0)
= ((fib 1 + fib 0) + 1) + 1 + 0
= 1 + 0 + 1 + 1 + 0
-}

-- | Counts numbers from 1 to n which divide n exactly. Assume n >= 1
countDivisors :: Int -> Int
countDivisors n = go n
    where
        go d
            | d == 1 = 1
            | n `mod` d == 0 = 1 + go (d - 1)
            | otherwise = go (d - 1)

-- | Returns true if n is prime. Returns False if n is not prime.
isPrime :: Int -> Bool
isPrime n
    | n <= 1 = False
    | otherwise = go (n - 1)
        where
            go d
                | d == 1 = True
                | n `mod` d == 0 = False
                | otherwise = go (d - 1)

-- | Returns true if n is prime. Returns False if n is not prime. Using countDivisors
isPrime2 :: Int -> Bool
isPrime2 n
    | n <= 1 = False
    | otherwise = countDivisors n == 2

-- | Sums range between a and b. a <= b required
sumRange :: Int -> Int -> Int
sumRange a b
    | a > b = error "a <= b required"
    | a == b = a
    | otherwise = a + sumRange (a + 1) b

-- | Counts number of appearancess of digit d in number.
countDigit :: Int -> Int -> Int
countDigit d n
    | d < 0 || d >= 10 = 0
    | d == 0 && n == 0 = 1
    | n < 0 = countDigit d (negate n)
    | n < 10 = if n == d then 1 else 0
    | n `mod` 10 == d = 1 + countDigit d (n `div` 10)
    | otherwise = countDigit d (n `div` 10)

