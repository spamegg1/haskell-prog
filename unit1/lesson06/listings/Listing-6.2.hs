isPalindrome :: Eq a => [a] -> Bool -- deriving equality for the type a
isPalindrome word = word == reverse word

-- GHCi> isPalindrome "cheese"
-- False
-- GHCi> isPalindrome "racecar"
-- True
-- GHCi> isPalindrome [1,2,3]
-- False
-- GHCi> isPalindome [1,2,1]
-- True
