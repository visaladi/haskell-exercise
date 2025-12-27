-- Classify a number as Positive, Negative or Zero
-- Implemented using:
-- 1) if-then-else
-- 2) guards
-- 3) pattern matching

-- 1️⃣ Conditional Style
signIf :: (Ord a, Num a) => a -> String
signIf x =
    if x > 0 then "Positive"
    else if x < 0 then "Negative"
    else "Zero"


-- 2️⃣ Guarded Style
signGuard :: (Ord a, Num a) => a -> String
signGuard x
  | x > 0     = "Positive"
  | x < 0     = "Negative"
  | otherwise = "Zero"


-- 3️⃣ Pattern Matching Style (with guards)
signPattern :: (Ord a, Num a) => a -> String
signPattern 0 = "Zero"
signPattern x
  | x > 0     = "Positive"
  | otherwise = "Negative"


-- Test Main
main :: IO ()
main = do
    putStrLn (signIf 5)
    putStrLn (signGuard (-3))
    putStrLn (signPattern 0)
