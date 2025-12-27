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

Annum :: IO ()
Annum = do
    putStrLn "Enter Principal (p): "
    pInput <- getLine

    putStrLn "Enter Rate (r) as decimal (e.g., 0.1 for 10%): "
    rInput <- getLine

    putStrLn "Enter Number of Years (n): "
    nInput <- getLine

    let p = read pInput :: Double
    let r = read rInput :: Double
    let n = read nInput :: Int

    let amount = p * (1 + r) ^ n

    putStrLn ("Total Amount After " ++ show n ++ " Years = " ++ show amount)

main :: IO ()
main = sumAndSquares
ann = Annum
