-- Strict (non-lazy) IO version of the same program.
-- Data.Text is non-lazy.
{-# LANGUAGE OverloadedStrings #-}

import System.IO                     -- hGetContents, openFile, hClose, ReadMode
import System.Environment                                  -- needed for getArgs
import qualified Data.Text as T
import qualified Data.Text.IO as TI

getCounts :: T.Text -> (Int, Int, Int)
getCounts input = (charCount, wordCount, lineCount) where
    charCount = T.length input
    wordCount = (length . T.words) input
    lineCount = (length . T.lines) input

countsText :: (Int, Int, Int) -> T.Text
countsText (cc,wc,lc) = T.pack $ unwords list where
    list = ["chars: ", show cc, " words: ", show wc, " lines: ", show lc]

main :: IO ()
main = do
    args <- getArgs                                   -- [String] <- IO [String]
    let fileName = head args                                           -- String
    input <- TI.readFile fileName                         -- T.Text <- IO T.Text
    let summary = (countsText . getCounts) input                       -- T.Text
    let appendText = mconcat [(T.pack fileName), " ",summary, "\n"]    -- T.Text
    TI.appendFile "stats.dat" appendText                                -- IO ()
    TI.putStrLn summary                                                 -- IO ()
