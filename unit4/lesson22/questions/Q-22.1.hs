-- Q22.1
-- Write a program, simple_calc.hs, that reads simple equations
-- involving adding two numbers or multiplying two numbers.
-- The program should solve the equation each
-- user types into each line as each line is entered.

-- Answer:
solve :: [String] -> Int
solve (int1 : "+" : int2 : rest) = (read int1) + (read int2)
solve (int1 : "*" : int2 : rest) = (read int1) * (read int2)

main :: IO ()
main = do
    userInput <- getContents                              -- [Char] <- IO [Char]
    print $ solve $ lines userInput

-- ghc Q-22.1.hs -o simple_calc
-- ./simple_calc
-- 2
-- +
-- 3
-- 5
