getCounts :: String -> (Int, Int, Int)
getCounts input = (charCount, wordCount, lineCount) where
    charCount = length input
    wordCount = (length . words) input
    lineCount = (length . lines) input
