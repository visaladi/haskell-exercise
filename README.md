# 📚 Functional Programming – Haskell Exercises

A curated collection of Haskell programs, examples, and exercises demonstrating fundamental concepts in Functional Programming (FP). Perfect for learning or reinforcing core FP techniques using Haskell.

---

## 📖 Table of Contents

- [🔍 Introduction](#-introduction)
- [🛠️ Language & Tools](#-language--tools)
- [✅ Contents](#-contents)
  - [1️⃣ Prime Number Code (Lazy + Modular)](#1️⃣-prime-number-code-lazy--modular)
  - [2️⃣ Nat → Int (Peano Numbers)](#2️⃣-nat--int-peano-numbers)
  - [3️⃣ Expression Tree (Algebraic Data Type)](#3️⃣-expression-tree-algebraic-data-type)
  - [4️⃣ Conditional / Guard / Pattern Matching](#4️⃣-conditional--guard--pattern-matching)
  - [5️⃣ Hangman (Terminal Game)](#5️⃣-hangman-terminal-game)
  - [6️⃣ Nim Game (1-Pile Version)](#6️⃣-nim-game-1-pile-version)
- [🎯 Key Concepts Demonstrated](#-key-concepts-demonstrated)
- [🚀 How to Use This Repo](#-how-to-use-this-repo)
- [👨‍🎓 Suitable For](#-suitable-for)
- [📄 License](#-license)

---

## 🔍 Introduction

This project is a hands-on functional programming playground using Haskell. It includes a variety of examples and small games that showcase core FP ideas such as lazy evaluation, recursion, algebraic data types, and modular pipelines.

---

## 🛠️ Language & Tools

- **Language**: Haskell
- **Compiler**: GHC / GHCi
- **Recommended Editors**: VS Code, IntelliJ, or Haskell Platform

### 🔧 Run Programs

**Interactive Mode**  
```bash
ghci filename.hs
main
Compile & Run

bash
Copy code
ghc filename.hs
./filename   # Linux/Mac
filename.exe # Windows
✅ Contents
1️⃣ Prime Number Code (Lazy + Modular)
Includes:

Infinite prime generator

Sieve of Eratosthenes

Prime check function

Primes up to n using modular pipeline

haskell
Copy code
primes :: [Int]
primes = sieve [2..]
  where
    sieve (p:xs) = p : sieve [ x | x <- xs, x `mod` p /= 0 ]
    sieve []     = []

isPrime :: Int -> Bool
isPrime n
  | n < 2 = False
  | otherwise = all (\d -> n `mod` d /= 0) [2 .. floor (sqrt (fromIntegral n))]

primesUpTo :: Int -> [Int]
primesUpTo n = filter isPrime [2..n]
2️⃣ Nat → Int (Peano Numbers)
Modeling natural numbers using recursive algebraic types.

haskell
Copy code
data Nat = Zero | Succ Nat

nat2int :: Nat -> Int
nat2int Zero = 0
nat2int (Succ n) = 1 + nat2int n
3️⃣ Expression Tree (Algebraic Data Type)
Expression tree for arithmetic expressions with evaluation.

haskell
Copy code
data Expr
  = Val Int
  | Add Expr Expr
  | Mul Expr Expr

eval :: Expr -> Int
eval (Val n) = n
eval (Add x y) = eval x + eval y
eval (Mul x y) = eval x * eval y
Example:

h
Copy code
eval (Mul (Add (Val 1) (Val 2)) (Val 5)) -- Output: 15
4️⃣ Conditional / Guard / Pattern Matching
Various methods to return the sign of a number.

haskell
Copy code
-- if-then-else
signIf x =
  if x > 0 then "Positive"
  else if x < 0 then "Negative"
  else "Zero"

-- guards
signGuard x
  | x > 0 = "Positive"
  | x < 0 = "Negative"
  | otherwise = "Zero"

-- pattern + guard
signPattern 0 = "Zero"
signPattern x
  | x > 0 = "Positive"
  | otherwise = "Negative"
5️⃣ Hangman (Terminal Game)
A basic terminal-based Hangman game.

Features:

User guesses letters

Tracks attempts

Lazy, recursive game loop

haskell
Copy code
secretWord = "haskell"
maxAttempts = 7
-- See full code in `hangman.hs`
Run:

bash
Copy code
ghci hangman.hs
main
6️⃣ Nim Game (1-Pile Version)
A simple version of the Nim game against the computer.

Rules:

Start with a fixed number of stones (e.g., 15)

Players alternate removing 1–3 stones

Computer uses optimal strategy

haskell
Copy code
startStones = 15
-- Full implementation in `nim.hs`
Run:

bash
Copy code
ghci nim.hs
main
🎯 Key Concepts Demonstrated
Concept	Demonstrated In
Lazy evaluation	Prime generator, pipelines
Modular FP design	primesUpTo, sieve, isPrime
Recursion	nat2int, eval, Hangman
Algebraic datatypes	Nat, Expr
Pattern matching	Expr, Nat, signPattern
Guards	signGuard
Pure functions	isPrime, eval
IO + interaction	Hangman, Nim

🚀 How to Use This Repo
Clone or download this repository

Open your terminal or preferred Haskell editor

Run any file using:

bash
Copy code
ghci filename.hs
main
👨‍🎓 Suitable For
University-level FP assignments

Practicing Haskell syntax and design

Learning lazy evaluation and recursion

Understanding modular pipelines