-- Define the Expr data type
data Expr = Val Int
          | Add Expr Expr
          | Mul Expr Expr
          deriving (Show)

-- Function to count size
size :: Expr -> Int
size (Val _)   = 1
size (Add x y) = size x + size y
size (Mul x y) = size x + size y

-- Function to evaluate expression
eval :: Expr -> Int
eval (Val n)   = n
eval (Add x y) = eval x + eval y
eval (Mul x y) = eval x * eval y

-- Example Expression:
-- Add (Val 2) (Mul (Val 3) (Val 4))

expr :: Expr
expr = Add (Val 2) (Mul (Val 3) (Val 4))

main :: IO ()
main = do
    putStrLn ("Size = " ++ show (size expr))
    putStrLn ("Value = " ++ show (eval expr))
