# Unit 1: Expressions, values and types

## GHCi

- An expression evaluates to a value. GHCi prints it.
- `:t expr` shows the type without evaluating. Read `::` as "has type".
- `:load File.hs` loads a file; `:reload` picks up edits.

## Types

- Concrete types are capitalised: `Int`, `Double`, `Bool`, `Char`, `String`.
  A lowercase name in a type (`a`) is a type variable.
- `Bool -> Bool` is a function type. In `Int -> Int -> Int`, the last type is
  the result and the rest are arguments.

## Definitions

```haskell
double :: Int -> Int   -- type signature
double x = x * 2       -- equation
```

## Application

- Application is a space: `double 5`.
- It binds tighter than any operator: `double 3 + 1` is `(double 3) + 1`.
- It groups left: `double double 3` is `(double double) 3`, a type error.
  Write `double (double 3)`.
- Brackets are needed only when an argument is itself compound.
  `fromIntegral x` is fine; `fromIntegral (w * h)` needs them.
- Spacing never changes precedence: `c * 9/5` is `(c * 9) / 5`.

## Numeric types

- `3 :: Num a => a`: a whole-number literal can be any `Num` type.
- `3.5 :: Fractional a => a`: a decimal literal needs a `Fractional` type
  (`Double` is one, `Int` is not). `3.5 :: Int` is an error.
- `Num a =>` is a constraint. A type that satisfies one is an **instance** of
  that class (type classes come later).
- **A literal has no fixed type until context gives it one. A function's
  result has a fixed type.**
  - `half 3 + 1` works: `1` becomes a `Double`.
  - `square 3 + 0.5` fails: `0.5` would have to be an `Int`.
- Haskell never converts between numeric types implicitly.
  `average (double 2) 3` fails.
- `fromIntegral :: (Integral a, Num b) => a -> b` converts a whole number to
  whatever numeric type the context needs.

## Unstable during the unit

- Literals compared with fixed types. Improved in review; one slip remained
  (thinking the `2` in `half 2` became a `Double`).
