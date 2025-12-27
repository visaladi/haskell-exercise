sumAndSquares :: IO ()
sumAndSquares = do
    -- Step 1: Generate list 1 to 100
    let numbers = [1..100]

    -- Step 2: Filter numbers divisible by 3 or 5
    let divisible = [x | x <- numbers, x `mod` 3 == 0 || x `mod` 5 == 0]

    -- Step 3: Sum of numbers
    let total = sum divisible

    -- Step 4: Sum of squares
    let totalSquares = sum (map (^2) divisible)

    -- Step 5: Print results
    putStrLn $ "Numbers divisible by 3 or 5: " ++ show divisible
    putStrLn $ "Sum: " ++ show total
    putStrLn $ "Sum of Squares: " ++ show totalSquares
    putStrLn $ "Result Tuple: (" ++ show total ++ ", " ++ show totalSquares ++ ")"



main :: IO ()
main = sumAndSquares

