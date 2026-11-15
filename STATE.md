# Course State

## Environment

ghcup toolchain verified working: GHC 9.6.7, cabal 3.14, HLS 2.13.
Work in plain `.hs` files with GHCi (`:load`, `:reload`). Start `ghci` in the
course directory so `.ghci` (`:set -Wall`) is loaded.

Layout: `unitNN/` holds `Scratch.hs` (explanation) and `Drills.hs`;
`notes/unitNN.md` holds the write-up.

## Covered

**Unit 1: expressions, values and types** (`notes/unit01.md`).
GHCi, `:t`, type signatures and equations, multi-argument functions,
application precedence and left grouping, numeric literals and constraints,
no implicit conversion, `fromIntegral`.

Solid: definitions, application and brackets, reading simple type errors.
Needs support: literals compared with fixed types (improving).

**Unit 2: branching** (`notes/unit02.md`).
`if` as an expression, guards, pattern matching (literals, variables, `_`,
several arguments), equation order, partial functions, `-Wall`.

Solid: branch types and literals (the unit 1 weak spot now looks steady),
guard order, choosing guards or patterns.
Needs support: multi-argument patterns (fine in review), boundary values.

## Current unit

**Unit 3: recursion on numbers.** Not started. Base cases as patterns,
boundaries (where recursion stops). Fold in `where`/`let` when needed.
