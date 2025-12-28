-- Infinite list of primes (lazy)
primes :: [Int]
primes = sieve [2..]
  where
    sieve (p:xs) = p : sieve [ x | x <- xs, x `mod` p /= 0 ]
    sieve []     = []
