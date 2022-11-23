helloPerson :: String -> String
helloPerson name = "Hello " ++ name ++ "!"

main :: IO ()
main = do
    putStrLn "Hello! What is your name?"
    name <- getLine                                                 -- IO String
    let statement = helloPerson name
    putStrLn statement                                        -- String -> IO ()

