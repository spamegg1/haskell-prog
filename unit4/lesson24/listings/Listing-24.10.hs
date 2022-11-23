-- readFile :: FilePath -> IO String
-- readFile name = do
--     inputFile <- openFile name ReadMode
--     hGetContents inputFile

import System.Environment                                  -- needed for getArgs
import System.IO                     -- hGetContents, openFile, hClose, ReadMode

getCounts :: String -> (Int, Int, Int)
getCounts input = (charCount, wordCount, lineCount) where
    charCount = length input
    wordCount = (length . words) input
    lineCount = (length . lines) input

countsText :: (Int, Int, Int) -> String
countsText (cc, wc, lc) = unwords list where
    list = ["chars: ", show cc, " words: ", show wc, " lines: ", show lc]


main :: IO ()
main = do
    args <- getArgs                                   -- [String] <- IO [String]
    let fileName = head args                                           -- String

    file <- openFile fileName ReadMode                    -- Handle <- IO Handle
    input <- hGetContents file                            -- String <- IO String

    let summary = (countsText . getCounts) input                       -- String
    putStrLn summary                                                    -- IO ()

    hClose file                                                         -- IO ()
    appendFile "stats.dat" $ mconcat [fileName, " ", summary, "\n"]     -- IO ()

-- ghc Listing-24.10.hs -o fileCounts
-- ./fileCounts stats.dat
-- chars:  43  words:  7  lines:  1
