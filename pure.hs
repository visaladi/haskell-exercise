-- Check if a number is prime
isPrime :: Int -> Bool
isPrime n
  | n < 2     = False
  | otherwise = null [ d | d <- [2 .. limit], n `mod` d == 0 ]
  where
    limit = floor (sqrt (fromIntegral n))

-- Generate all primes up to a given limit
primesUpTo :: Int -> [Int]
primesUpTo n = [ p | p <- [2 .. n], isPrime p ]

-- Get all prime triplets (three consecutive primes) up to a given number
primeTriplets :: Int -> [(Int, Int, Int)]
primeTriplets n =
  [ (a, b, c)
  | (a, b, c) <- zip3 ps (drop 1 ps) (drop 2 ps)
  , c <= n
  ]
  where
    ps = primesUpTo n
