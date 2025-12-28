isPrime :: Int -> Bool
isPrime n
  | n < 2     = False
  | otherwise = all (\d -> n `mod` d /= 0) [2 .. limit]
  where
    limit = floor (sqrt (fromIntegral n))
