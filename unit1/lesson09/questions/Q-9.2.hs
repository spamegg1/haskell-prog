-- Q9.2
-- Your isPalindrome function from lesson 6 doesn’t handle
-- sentences with spaces or capitals.
-- Use map and filter to make sure the phrase
-- “A man a plan a canal Panama” is recognized as a palindrome.
import Data.Char

isPalindrome :: String -> Bool -- deriving equality for the type a
isPalindrome word = let
    removeSpaces = filter ( /= ' ') word
    lowerCase = map toLower removeSpaces
    in lowerCase == reverse lowerCase

-- GHCi> isPalindrome "A man a plan a canal Panama"
-- True
