import System.Environment                   -- needed for getArgs :: IO [String]

main :: IO ()
main = do
    args <- getArgs                                   -- [String] <- IO [String]
    let linesToRead = if length args > 0 then read (head args) else (0 :: Int)

    -- print :: Show a => a -> IO (), so here a = Int
    print linesToRead                                 -- print = putStrLn . show
