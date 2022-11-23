import System.Environment                    -- needed for getArgs :: IO[String]

main :: IO ()
main = do
    -- getArgs is IO[String], <- gets rid of the IO, so args is like [String]
    args <- getArgs

    -- mapM_ :: (Foldable t, Monad m) => (a -> m b) -> t a -> m ()
    -- putStrLn :: String -> IO (), so putStrLn is: (a -> m b)
    -- args :: [String], so args is: t a
    -- this means: a is String, m is IO, b is (), t is []
    -- so [] is an instance of Foldable, IO is an instance of Monad
    mapM_ putStrLn args             -- print each argument on a separate newline

-- ghc Listing-22.3.hs -o getArgs
-- ./getArgs first second third fourth
-- first
-- second
-- third
-- fourth
