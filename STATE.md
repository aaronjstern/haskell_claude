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

**Unit 3: recursion on numbers** (`notes/unit03.md`).
Base and recursive cases, substitution traces, non-termination and
stack overflow, `error`, steps other than `- 1`, several base cases,
tail recursion, `where` helpers, reusing functions, Haddock comments.
`mod`, `div` vs `quot`, `even`/`odd`, `||`/`&&`.

Solid: recursion shape, traces, `where` helpers, diagnosing a bug
once a failing test exists.
Needs support: edge inputs (the recurring weak spot, improved across
the review); knowing expected answers before testing; guards firing
on every recursive call.

## Current unit

**Unit 4: lists and recursion on lists.** Not started. List syntax, `(x:xs)`
patterns, the empty list as base case. Carry the edge checklist over.
