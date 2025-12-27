main :: IO ()
main = do
    putStrLn "Enter a:"
    aInput <- getLine

    putStrLn "Enter b:"
    bInput <- getLine

    putStrLn "Enter c:"
    cInput <- getLine

    let a = read aInput :: Double
    let b = read bInput :: Double
    let c = read cInput :: Double

    let discriminant = b^2 - 4*a*c

    if discriminant < 0 then
        putStrLn "No real roots (discriminant < 0)"
    else do
        let root1 = (-b + sqrt discriminant) / (2*a)
        let root2 = (-b - sqrt discriminant) / (2*a)
        putStrLn ("Roots as Tuple: (" ++ show root1 ++ ", " ++ show root2 ++ ")")
