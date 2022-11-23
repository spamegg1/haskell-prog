-- Write the code to check whether the second line is empty before writing it
-- to a file.

-- Answer:
import System.IO

main :: IO ()
main = do
    helloFile <- openFile "hello.txt" ReadMode            -- Handle <- IO Handle
    hasLine <- hIsEOF helloFile                               -- Bool -> IO Bool
    firstLine <-  if not hasLine
                then hGetLine helloFile
                else return "empty"

    hasSecondLine <- hIsEOF helloFile                         -- Bool -> IO Bool
    secondLine <- if not hasSecondLine
                then hGetLine helloFile
                else return ""

    goodbyeFile <- openFile "goodbye.txt" WriteMode       -- Handle <- IO Handle
    hPutStrLn goodbyeFile secondLine                                    -- IO ()

    hClose helloFile                                                    -- IO ()
    hClose goodbyeFile                                                  -- IO ()
    putStrLn "done!"                                                    -- IO ()

