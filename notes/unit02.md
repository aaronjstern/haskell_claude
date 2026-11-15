# Unit 2: Branching

## `if`

```haskell
absolute :: Int -> Int
absolute x = if x < 0 then negate x else x
```

- `if` is an expression with a value, so `else` is required.
- The test must be a `Bool`. There is no truthiness: `if 1 ...` fails with
  `Num Bool`, meaning a number literal ended up where a `Bool` must go.
- Both branches share one type. `if True then 1 else 2.5 :: Fractional a => a`;
  `if True then 1 else 'a'` fails.

## Guards

```haskell
sign :: Int -> Int
sign x
  | x < 0     = -1
  | x == 0    = 0
  | otherwise = 1
```

- `| condition = result`. Checked top to bottom; the first `True` wins.
- `otherwise` is just `True`. Put it last.
- `==` tests equality; `=` defines.
- Guards can express ranges, so use them for conditions.

## Pattern matching

```haskell
describe :: Int -> String
describe 0 = "zero"
describe n = "many: " ++ show n

isZero :: Int -> Bool
isZero 0 = True
isZero _ = False
```

- One equation per case, tried top to bottom.
- A literal pattern matches that value. A variable matches anything and names
  it. `_` matches anything without naming it.
- With several arguments, each equation gives a pattern for each:
  `xor True False = True`. Put the most specific equation first and the
  catch-all last.
- Patterns match exact values, not ranges. The **type** decides which inputs
  must be handled, not the intended use.
- All equations for a function must be adjacent. A misspelt name in between
  (`dayname`) starts a new definition, giving `Multiple declarations`.

## Partial functions

If no guard or pattern matches, the call crashes at run time
(`Non-exhaustive patterns`). End with `otherwise` or a catch-all.

## Warnings

- The course `.ghci` sets `-Wall`. It is only read when `ghci` starts in the
  course directory. Load files as `unit02/File.hs`.
- `-Wall` reports incomplete patterns, unused variables, redundant cases and
  type defaulting.
- It cannot reason about comparisons: guards in the wrong order
  (`x > 79` before `x > 89`) give no warning.
- Warnings appear only when GHCi compiles. `:r` on an unchanged file is silent;
  `:l` again forces a compile.

## Small things met along the way

- `negate`, `not`, `show`, `++` (join strings), `div` (whole-number division;
  `div 7 0` throws).
- Backticks make a function infix: ``x `div` y`` is `div x y`.
- `(^) :: (Num a, Integral b) => a -> b -> a`. A bare exponent `2` is
  defaulted to `Integer`, with a warning. Pin it with `(2 :: Int)`.
- `expr :: Type` inside an expression is an inline annotation.

## Unstable during the unit

- Multi-argument patterns: reached for guards first in `xor`. Fine in review.
- Boundaries: `< 0` where `<= 0` was needed.
- Load and test before calling a drill done.
