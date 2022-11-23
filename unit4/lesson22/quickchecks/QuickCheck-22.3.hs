-- Use lazy I/O to write a program that reverses your input and prints it
-- back to you.

-- Answer:
main :: IO ()
main = do
    userInput <- getContents                              -- [Char] <- IO [Char]

    -- reverse :: [a] -> [a] and userInput :: [Char], so a = Char, so:
    -- (reverse userInput) :: [Char] = String, and putStrLn :: String -> IO ()
    putStrLn (reverse userInput)                                        -- IO ()
