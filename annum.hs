main :: IO ()
main = do
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
