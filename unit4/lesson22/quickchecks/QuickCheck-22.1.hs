-- Write a main that uses mapM to call getLine three times, and then use
-- mapM_ to print out the values’ input.
-- (Hint: You’ll need to throw away an argument when using mapM
-- with getLine; use (\_ -> ...) to achieve this.)

-- Answer:
-- Remember that getLine :: IO String, so getLine is not a function.
-- Turn it into a function with (\_ -> getLine).

main :: IO ()
main = do
    lines <- mapM (\_ -> getLine) [1..3]
    mapM_ putStrLn lines
