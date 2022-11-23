helloName :: String -> String
helloName name = "Hello " ++ name ++ "!"

main :: IO ()
main = do
    name <- getLine                                       -- String <- IO String
    let statement = helloName name                                     -- String
    putStrLn statement                                                  -- IO ()

main2 :: IO ()
main2 = getLine >>=                                                 -- IO String
    (\name ->                                                       -- String ->
        (\statement -> putStrLn statement)                    -- String -> IO ()
        (helloName name))                                              -- String
