import System.IO

-- type FilePath = String
-- data IOMode = ReadMode | WriteMode | AppendMode | ReadWriteMode
-- openFile :: FilePath -> IOMode -> IO Handle
-- hClose :: Handle -> IO ()

main :: IO ()
main = do
    myFile <- openFile "hello.txt" ReadMode               -- Handle <- IO Handle
    hClose myFile                                                       -- IO ()
    putStrLn "done!"                                                    -- IO ()
