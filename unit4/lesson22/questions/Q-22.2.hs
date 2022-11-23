-- Q22.2
-- Write a program that allows a user to select a number between 1
-- and 5 and then prints a famous quote (quotes are of your choosing).
-- After printing the quote, the program will ask whether the user
-- would like another. If the user enters n , the program ends; otherwise,
-- the user gets another quote. The program repeats until the user enters n .
-- Try to use lazy evaluation and treat the user input as a list
-- rather than recursively calling main at the end.

-- Answer:
quotes = ["q1", "q2", "q3", "q4", "q5"]

lookupQuote :: [String] -> [String]
lookupQuote [] = []
lookupQuote ("n" : qs) = []
lookupQuote (q : qs) = (quotes !! (read q - 1)) : lookupQuote qs

main :: IO ()
main = do
    userInput <- getContents
    mapM_ putStrLn $ lookupQuote $ lines userInput

-- ghc Q-22.2.hs -o quote
-- ./quote
-- 1
-- q1
-- 2
-- q2
-- 3
-- q3
-- 4
-- q4
-- 5
-- q5
-- n
