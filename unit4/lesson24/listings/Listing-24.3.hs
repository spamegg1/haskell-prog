import System.IO

-- hGetLine :: Handle -> IO String
-- hPutStrLn :: Handle -> String -> IO ()

main :: IO ()
main = do
    helloFile <- openFile "hello.txt" ReadMode            -- Handle <- IO Handle
    firstLine <- hGetLine helloFile                       -- String <- IO String
    putStrLn firstLine                                                  -- IO ()

    secondLine <- hGetLine helloFile                      -- String <- IO String
    goodbyeFile <- openFile "goodbye.txt" WriteMode       -- Handle <- IO Handle
    hPutStrLn goodbyeFile secondLine                                    -- IO ()

    hClose helloFile                                                    -- IO ()
    hClose goodbyeFile                                                  -- IO ()
    putStrLn "done!"                                                    -- IO ()
