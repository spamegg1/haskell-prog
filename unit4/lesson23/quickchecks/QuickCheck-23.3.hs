-- Create your own version of T.lines and T.unlines by
-- using splitOn and T.intercalate.

-- Answer:
{-# LANGUAGE OverloadedStrings #-}
import qualified Data.Text as T

myLines :: T.Text -> [T.Text]
myLines = T.splitOn "\n"

myUnlines :: [T.Text] -> T.Text
myUnlines = T.intercalate "\n"

sampleInput :: T.Text
sampleInput = "this\nis\ninput"

main :: IO ()
main = do
    print $ myLines sampleInput                         -- ["this","is","input"]
    print $ myUnlines $ myLines sampleInput                 -- "this\nis\ninput"
