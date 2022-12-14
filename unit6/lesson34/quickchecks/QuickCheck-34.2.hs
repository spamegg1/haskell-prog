-- Modify the module declaration so that you also export preprocess.

-- Answer:
module Palindrome(isPalindrome, preprocess) where
import Data.Char (toLower,isSpace,isPunctuation)

stripWhiteSpace :: String -> String
stripWhiteSpace = filter (not . isSpace)

stripPunctuation :: String -> String
stripPunctuation text = filter (not . isPunctuation) text

toLowerCase :: String -> String
toLowerCase text = map toLower text

preprocess :: String -> String
preprocess = stripWhiteSpace . stripPunctuation . toLowerCase

isPalindrome :: String -> Bool
isPalindrome text = cleanText == reverse cleanText
    where cleanText = preprocess text

