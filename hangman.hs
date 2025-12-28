import System.IO (hSetBuffering, BufferMode(NoBuffering), stdout)

-- The secret word for the game
secretWord :: String
secretWord = "haskell"

maxAttempts :: Int
maxAttempts = 7

-- Entry point
main :: IO ()
main = do
    hSetBuffering stdout NoBuffering
    putStrLn "=== HANGMAN (Haskell Version) ==="
    putStrLn "Guess the word, one letter at a time."
    putStrLn $ "You have " ++ show maxAttempts ++ " wrong attempts."
    gameLoop secretWord [] maxAttempts


-- Main game loop
gameLoop :: String -> [Char] -> Int -> IO ()
gameLoop word guessed remaining = do
    putStrLn ""
    putStrLn $ "Word: " ++ displayWord word guessed
    putStrLn $ "Guessed letters: " ++ guessed
    putStrLn $ "Remaining wrong attempts: " ++ show remaining

    if wordGuessed word guessed then do
        putStrLn "✅ You guessed the word! You win!"
    else if remaining <= 0 then do
        putStrLn "❌ No attempts left. You lost."
        putStrLn $ "The word was: " ++ word
    else do
        putStr "Enter a letter: "
        guessLine <- getLine
        let guess = if null guessLine then ' ' else head guessLine

        if guess `elem` guessed then do
            putStrLn "You already guessed that letter. Try again."
            gameLoop word guessed remaining
        else if guess `elem` word then do
            putStrLn "Good guess!"
            gameLoop word (guess : guessed) remaining
        else do
            putStrLn "Wrong guess."
            gameLoop word (guess : guessed) (remaining - 1)


-- Show the word with unguessed letters as '_'
displayWord :: String -> [Char] -> String
displayWord word guessed =
    [ if c `elem` guessed then c else '_' | c <- word ]

-- Check if all letters of the word have been guessed
wordGuessed :: String -> [Char] -> Bool
wordGuessed word guessed =
    all (`elem` guessed) word
