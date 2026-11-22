# Unit 3: Recursion on Numbers

## Base case and recursive case

```haskell
factorial :: Int -> Int
factorial n
  | n < 0     = error "factorial: negative input"
  | n == 0    = 1
  | otherwise = n * factorial (n - 1)
```

- The **base case** answers directly. The **recursive case** answers using a
  smaller version of the same problem.
- Write `factorial (n - 1)`, not `factorial n - 1` (that is
  `(factorial n) - 1`). Likewise `factorial (-1)`.
- Base cases can be patterns (`power _ 0 = 1`) or guards (`n == 0`).

## Tracing by substitution

Replace a call with the right-hand side of the equation it matches, and repeat:

```
factorial 3
= 3 * factorial 2
= 3 * (2 * factorial 1)
= 3 * (2 * (1 * factorial 0))
= 3 * (2 * (1 * 1))
= 6
```

Since functions have no side effects, this is always valid reasoning. Haskell
is lazy, so the machine's exact order can differ. That comes later.

## When recursion never stops

`factorial (-1)` never reaches `0`. The pending multiplications pile up until
`*** Exception: stack overflow`. Ctrl-C interrupts a hung call.

`-Wall` cannot catch this: every input matches some equation, but some never
reach the base case. Decide what out-of-range inputs mean and handle them
*before* the recursive case (`error`, or a value).

`error :: String -> a` crashes immediately with the message.

## The step only has to make progress

- It need not be `n - 1`: `digits` uses ``n `div` 10``.
- A base case can be a range (`n < 10`). That needs a guard.
- A recursive call can move the input to a case already handled, without
  shrinking it: `| n < 0 = digits (negate n)`.

## Base cases follow the meaning

- `digits 0 = 1` (0 has one digit), but `sumDigits 0 = 0` (its digits sum to 0).
- `sumTo 0 = 0` is the true bottom, not `sumTo 1 = 1`.
- `sumRange a a = a`: one number, not zero. Count the *result*, not the steps.
- A function can have several base cases (`isPowerOfTwo`, `fib`).

## Shapes met

- **Counting:** no counter variable. Add `1 +` to the recursive result, and
  let the base case supply the starting value (`countDown`, `collatz`).
- **One argument fixed, one changing:** `power b e`, `mult x y`.
- **Tail recursion:** `euclid a b = euclid b (a `mod` b)`. Nothing waits, and
  the last call's answer is the answer.
- **Two recursive calls:** `fib (n - 1) + fib (n - 2)` repeats work, and the
  number of calls grows about 1.6× per step. `fib 32` takes seconds. A DSA
  topic for later.

## `where` and helpers

```haskell
countDivisors :: Int -> Int
countDivisors n = go n
  where
    go d
      | d == 1         = 1
      | n `mod` d == 0 = 1 + go (d - 1)
      | otherwise      = go (d - 1)
```

- `where` defines local names visible to the whole equation, including all its
  guards. It must be indented further than the start of the definition.
- The helper can see `n`, so it takes only what changes. `go` is a convention.
- Reuse existing functions: `isPrime n = countDivisors n == 2`, guarded by
  `n <= 1 = False` because `countDivisors` assumes `n >= 1`.

## Every guard runs on every call

In `countDigit`, the guard `d == 0 && n == 0 = 1` was meant for the original
input, but recursion reaches `n == 0` at the end of every number, so it fired
there too. A special case for the top-level input needs a `where` helper, or a
base case the recursion handles correctly (`n < 10`).

## Doc comments (Haddock)

```haskell
-- | Number of decimal digits in n. Negatives count the same as positive.
digits :: Int -> Int
```

`-- |` before the signature. Say what the function means and what it assumes.

## Small things met along the way

- `mod` gives the remainder: ``472 `mod` 10 == 2``.
- `div` rounds toward negative infinity: ``(-91) `div` 10 == -10``. `quot`
  rounds toward zero.
- `even`, `odd`.
- `||` (or), `&&` (and).
- Don't compare a `Bool` with `False`: `not (even n)` or `odd n`.
- Backticked `div`/`mod` bind tighter than `+`, like `*`.
- `f (x - 1)`, not `f(x - 1)`: the brackets group, they are not call syntax.

## Mistakes that taught something

- **Edge inputs, repeatedly.** Negatives in `digits` gave a silent wrong
  answer. A `< -10` boundary missed `-10`. `div` rounding broke `-91`.
  `isPrime 1` errored instead of returning `False`. `isPrime2` hung on
  negatives because the assumption of `countDivisors` wasn't guarded.
  `countDigit`'s `d > 10` missed `10`. Each was found by testing, not
  beforehand.
- **Testing without an expected answer.** `countDigit 0 0` was run but the
  wrong output looked fine. Know the expected answer before running.
- **Fixing one case broke others.** `countDigit`: a special-case guard fired
  on every call. Then a constant base case (`n < 10 = 0`) skipped the leading
  digit. Re-test the old cases after every fix.
- **Edge checklist**, per argument: `0`, negatives, just around the base case,
  values the spec doesn't cover. Run it before writing, or straight after a
  first version. Either works if it actually gets run.
- **When a drill seems to need something new**, look back: it is usually a
  pattern already seen in a new place (counting in `collatz`).
- **"Build on what you have"** can mean reuse the function itself.
