module Main where

head :: Monoid a => [a] -> a
head (x : _) = x
head [] = mempty

example :: [[Int]]
example = []

main :: IO ()
main = do
    putStrLn $ show $ Main.head example
