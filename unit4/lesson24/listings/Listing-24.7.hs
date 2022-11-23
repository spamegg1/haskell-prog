getCounts :: String -> (Int, Int, Int)
getCounts input = (charCount, wordCount, lineCount) where
    charCount = length input
    wordCount = (length . words) input
    lineCount = (length . lines) input

-- unwords :: [String] -> String

countsText :: (Int, Int, Int) -> String
countsText (cc, wc, lc) = unwords list where
    list = ["chars: ", show cc, " words: ", show wc, " lines: ", show lc]

-- GHCi> (countsText . getCounts) "this is\n some text"
-- "chars: 18 words: 4 lines: 2"
