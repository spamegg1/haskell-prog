-- Rewrite echo using do notation.

-- Answer:
echo :: IO ()
echo = do
    line <- getLine
    putStrLn line
