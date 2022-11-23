import System.Environment                                  -- needed for getArgs

getCounts :: String -> (Int, Int, Int)
getCounts input = (charCount, wordCount, lineCount) where
    charCount = length input
    wordCount = (length . words) input
    lineCount = (length . lines) input

countsText :: (Int, Int, Int) -> String
countsText (cc, wc, lc) = unwords list where
    list = ["chars: ", show cc, " words: ", show wc, " lines: ", show lc]


-- readFile :: FilePath -> IO String
-- appendFile :: FilePath -> String -> IO ()

main :: IO ()
main = do
    args <- getArgs                                   -- [String] <- IO [String]
    let fileName = head args                                           -- String
    input <- readFile fileName                            -- String <- IO String
    let summary = (countsText . getCounts) input                       -- String
    appendFile "stats.dat" $ mconcat [fileName, " ", summary, "\n"]     -- IO ()
    putStrLn summary                                                    -- IO ()

-- ghc Listing-24.8.hs -o fileCounts
-- ./fileCounts hello.txt
-- chars: 29 words: 5 lines: 2
-- cat ./stats.dat
-- hello.txt chars: 29 words: 5 lines: 2
