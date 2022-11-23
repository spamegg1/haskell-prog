import System.IO

-- hIsEOF :: Handle -> IO Bool

main :: IO ()
main = do
    helloFile <- openFile "hello.txt" ReadMode            -- Handle <- IO Handle
    hasLine <- hIsEOF helloFile                               -- Bool -> IO Bool
    firstLine <- if not hasLine
                then hGetLine helloFile
                else return "empty"
    putStrLn "done!"                                                    -- IO ()
