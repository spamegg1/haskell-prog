main :: IO ()
main = do
    -- getContents :: IO String, but it keeps taking input chars lazily
    -- over and over until it receives an end of file signal,
    -- so it's actually more like getContents :: IO [Char]
    userInput <- getContents                              -- [Char] <- IO [Char]

    -- mapM_ :: (Foldable t, Monad m) => (a -> m b) -> t a -> m ()
    -- print :: Show a => a -> IO (), and userInput :: [Char]
    -- so, m = IO, b = (), t = [], a = Char,
    -- [] is an instance of Foldable, IO is an instance of Monad,
    -- mapM_ :: (Foldable [], Monad IO) => (Char -> IO ()) -> [Char] -> IO ()
    mapM_ print userInput                                               -- IO ()
