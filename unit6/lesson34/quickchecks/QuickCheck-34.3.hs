-- You shouldn’t leave Main.isPalindrome there, as it’s no longer necessary.
-- If you remove the code for Main.isPalindrome, how can you refactor your code
-- so you no longer need to qualify Palindrome.isPalindrome?

-- Answer:
-- Change import qualified Palindrome to import Palindrome. Then remove
-- Palindrome. from Palindrome.isPalindrome.
module Main where
import Palindrome

main :: IO ()
main = do
    print "Enter a word and I'll let you know if it's a palindrome!"
    text <- getLine
    let response = if isPalindrome text then "it is!" else "it's not"
    print response
