echo :: IO ()
echo = getLine >>= putStrLn

-- putStrLn :: String -> IO ()
-- getLine :: IO String
-- (>>=) :: Monad m => m a -> (a -> mb) -> mb
-- so a = String, m = IO, b = ()
-- (>>=) getLine putStrLn
-- (>>=) (IO String) (String -> IO ()) = IO ()
--        m     a        a   -> m  b   = m  b
