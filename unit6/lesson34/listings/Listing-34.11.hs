module Main where
import qualified Palindrome

main :: IO ()
main = do
    text <- getLine
    let response = if Palindrome.isPalindrome text then "yes" else "no"
    putStrLn response
