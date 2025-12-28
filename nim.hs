import System.IO (hSetBuffering, BufferMode(NoBuffering), stdout)

-- Starting number of stones
startStones :: Int
startStones = 15

-- Entry point
main :: IO ()
main = do
    hSetBuffering stdout NoBuffering
    putStrLn "=== Nim Game (Haskell) ==="
    putStrLn "There is a pile of stones."
    putStrLn "You and the computer take turns."
    putStrLn "On each turn, you may take 1, 2, or 3 stones."
    putStrLn "Whoever takes the last stone WINS."
    putStrLn $ "Starting with " ++ show startStones ++ " stones."
    gameLoop startStones True   -- True = your turn first

-- Main game loop
gameLoop :: Int -> Bool -> IO ()
gameLoop stones isPlayerTurn = do
    putStrLn ""
    putStrLn $ "Stones remaining: " ++ show stones
    if stones <= 0 then
        if isPlayerTurn
            then putStrLn "Computer took the last stone. You LOSE."
            else putStrLn "You took the last stone. You WIN!"
    else if isPlayerTurn then do
        playerMove <- getPlayerMove stones
        let newStones = stones - playerMove
        putStrLn $ "You took " ++ show playerMove ++ " stones."
        gameLoop newStones False
    else do
        let compMove = computerMove stones
        putStrLn $ "Computer takes " ++ show compMove ++ " stones."
        let newStones = stones - compMove
        gameLoop newStones True

-- Get a valid move from the user (1–3 and <= stones)
getPlayerMove :: Int -> IO Int
getPlayerMove stones = do
    putStr $ "Your move (1, 2, or 3 and <= " ++ show stones ++ "): "
    line <- getLine
    case reads line :: [(Int, String)] of
        [(n, "")] | n >= 1 && n <= 3 && n <= stones -> return n
        _ -> do
            putStrLn "Invalid move. Try again."
            getPlayerMove stones

-- Computer move with simple winning strategy
-- Try to leave a multiple of 4 for the player
computerMove :: Int -> Int
computerMove stones
    | stones <= 3 = stones
    | r == 0      = 1
    | otherwise   = r
  where
    r = stones `mod` 4
