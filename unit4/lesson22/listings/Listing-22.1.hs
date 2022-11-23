import System.Environment                    -- needed for getArgs :: IO[String]

main :: IO ()
main = do
    args <- getArgs                                   -- think of args as a list
    putStrLn ""                   -- this is here just to make this file compile
